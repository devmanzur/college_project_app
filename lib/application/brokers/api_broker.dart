import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:snapkart_app/application/constants.dart';
import 'package:snapkart_app/application/dto/api_response.dart';
import 'package:snapkart_app/application/dto/result.dart';
import 'package:sp_util/sp_util.dart';

class ApiBroker {
  Dio dio = new Dio();

  Future<Result<Map<String, dynamic>>> post(
      String url, Map<String, dynamic> data,
      [bool authenticationRequired = false]) async {
    FormData formData = data == null ? null : new FormData.fromMap(data);

    try {
      if (authenticationRequired) {
        setTokenHeader();
      }
      var response = await dio.post(url, data: formData);
      if (response.statusCode == 200) {
        return Result.ok<Map<String, dynamic>>(response.data);
      }
      return Result.error("failed to complete action", response.statusCode);
    } catch (error) {
      if (error is DioError) {
        if (error.response?.statusCode == 500) {
          return Result.error("failed to complete action", 500);
        } else if (error.response.statusCode == 401 ||
            error.response.statusCode == 403) {
          return Result.error("Action not allowed", 500);
        }

        var errorResponse = ApiResponse.fromJson(error.response.data);
        var message = errorResponse.errors?.first?.errorMessage;
        return Result.error(message, error.response.statusCode);
      } else {
        return Result.error("failed to complete action", 400);
      }
    }
  }

  Future<Result<Map<String, dynamic>>> fetch(String url,
      {Map<String, dynamic> queryParameters,
      bool authenticationRequired = false}) async {
    try {
      if (authenticationRequired) {
        setTokenHeader();
      }

      var response = await dio.get(url,queryParameters: queryParameters);
      if (response.statusCode == 200) {
        var data = response.data;
        return Result.ok<Map<String, dynamic>>(data);
      }
      return Result.error("failed to complete action", response.statusCode);
    } catch (error) {
      if (error is DioError) {
        var errorResponse = ApiResponse.fromJson(error.response.data);
        var message = errorResponse.errors?.first?.errorMessage;
        return Result.error(message, error.response.statusCode);
      } else {
        return Result.error("failed to complete action", 400);
      }
    }
  }

  void setTokenHeader() {
    var accessToken = SpUtil.getString(Constants.access_token_key);
    dio.options.headers["Authorization"] = "Bearer " + accessToken;
  }
}
