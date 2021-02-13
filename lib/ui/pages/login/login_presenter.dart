import 'package:dio/dio.dart';
import 'package:snapkart_app/application/brokers/api_broker.dart';
import 'package:snapkart_app/application/constants.dart';
import 'package:snapkart_app/application/data/core_data_provider.dart';
import 'package:snapkart_app/application/dto/api_response.dart';
import 'package:snapkart_app/application/dto/token_response.dart';
import 'package:snapkart_app/application/dto/result.dart';
import 'package:snapkart_app/application/locator.dart';
import 'package:sp_util/sp_util.dart';

class LoginPresenter {
  var broker = locator<ApiBroker>();

  Future<Result<TokenResponse>> userLogin(String phone, String password) async {
    var url = CoreDataProvider().getBaseUrl() + "account/login";

    var response = await broker.post(url, {
      'PhoneNumber': phone,
      'Password': password,
    });

    if (response.isSuccess) {
      var data = TokenResponse.fromJson(response.value);
      SpUtil.putString(Constants.access_token_key, data.body.token);
      SpUtil.putString(Constants.user_role_key, data.body.userRole);
      return Result.ok(data);
    }
    return Result.error(response.errorMessage, response.code);
  }
}
