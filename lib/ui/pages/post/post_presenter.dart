import 'dart:io';

import 'package:snapkart_app/application/brokers/api_broker.dart';
import 'package:snapkart_app/application/data/core_data_provider.dart';
import 'package:snapkart_app/application/dto/api_response.dart';
import 'package:snapkart_app/application/dto/result.dart';
import 'package:snapkart_app/application/locator.dart';
import 'package:snapkart_app/application/services/image_storage_service.dart';
import 'package:snapkart_app/core/models/snap_query.dart';

class PostPresenter {
  var broker = locator<ApiBroker>();
  var imageStorage = locator<ImageStorageService>();

  Future<Result<String>> makeBid(
      SnapQuery query, File file, double price, String details) async {
    var url = CoreDataProvider().getBaseUrl() + "posts/${query.id}/bids";
    var imageUpload = await imageStorage.uploadImage(file);
    if(!imageUpload.isSuccess){
      return Result.error(imageUpload.errorMessage, imageUpload.code);
    }

    var response = await broker.post(
        url,
        {
          'Image': imageUpload.value,
          'Price': price,
          'Details': details,
        },
        true);

    if (response.isSuccess) {
      return Result.ok("uploaded");
    }

    return Result.error(response.errorMessage, response.code);
  }

  Future<Result<String>> createPost(String details, File file, int categoryId, int areaId, int cityId, List<int> tags) async{

    var url = CoreDataProvider().getBaseUrl() + "posts";
    var imageUpload = await imageStorage.uploadImage(file);
    if(!imageUpload.isSuccess){
      return Result.error(imageUpload.errorMessage, imageUpload.code);
    }

    var response = await broker.post(
        url,
        {
          'Image': imageUpload.value,
          'Details': details,
          'CategoryId': categoryId,
          'AreaId': areaId,
          'CityId': cityId,
          'TagIds': tags.map((e) => e).toList()
        },
        true);

    if (response.isSuccess) {
      return Result.ok("uploaded");
    }

    return Result.error(response.errorMessage, response.code);
  }
}
