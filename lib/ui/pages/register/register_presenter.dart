import 'package:snapkart_app/application/brokers/api_broker.dart';
import 'package:snapkart_app/application/data/core_data_provider.dart';
import 'package:snapkart_app/application/dto/result.dart';
import 'package:snapkart_app/application/locator.dart';
import 'package:snapkart_app/core/models/category.dart';

class RegisterPresenter {
  var broker = locator<ApiBroker>();

  Future<Result<String>> registerCustomer(String name, String phone,
      String address, String password, String imageUrl) async {
    var url = CoreDataProvider().getBaseUrl() + "account/customer";

    var response = await broker.post(url, {
      'Name': name,
      'PhoneNumber': phone,
      'Address': address,
      'ImageUrl': imageUrl,
      'Password': password,
    });

    if (response.isSuccess) {
      return Result.ok<String>("success!");
    }
    return Result.error(response.errorMessage, response.code);
  }

  registerMerchant(
      String name,
      String phone,
      String address,
      String password,
      String imageUrl,
      int cityId,
      int areaId,
      List<Category> categories) async {
    var url = CoreDataProvider().getBaseUrl() + "account/merchant";
    var response = await broker.post(url, {
      'Name': name,
      'PhoneNumber': phone,
      'Address': address,
      'ImageUrl': imageUrl,
      'Password': password,
      'CityId': cityId,
      'AreaId': areaId,
      'SubscriptionIds': categories.map((e) => e.id).toList()
    });

    if (response.isSuccess) {
      return Result.ok<String>("success!");
    }
    return Result.error(response.errorMessage, response.code);

  }
}
