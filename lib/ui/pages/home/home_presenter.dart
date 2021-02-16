import 'package:snapkart_app/application/brokers/api_broker.dart';
import 'package:snapkart_app/application/data/core_data_provider.dart';
import 'package:snapkart_app/application/data/static_cache.dart';
import 'package:snapkart_app/application/dto/bid_items_response.dart';
import 'package:snapkart_app/application/dto/notification_response.dart';
import 'package:snapkart_app/application/dto/result.dart';
import 'package:snapkart_app/application/dto/time_line_item.dart';
import 'package:snapkart_app/application/locator.dart';
import 'package:snapkart_app/core/models/app_notification.dart';
import 'package:snapkart_app/core/models/bid.dart';
import 'package:snapkart_app/core/models/snap_query.dart';

class HomePresenter {
  var broker = locator<ApiBroker>();

  Future<Result<List<PostResponse>>> getPosts(
      {bool reload: false, int category: 0}) async {
    if (!reload &&
        StaticCache().selectedCategory == category &&
        StaticCache().posts.length > 0) {
      return Result.ok(StaticCache().posts);
    }

    var url = CoreDataProvider().getBaseUrl() + "posts";

    var response = await broker.fetch(url,
        authenticationRequired: true,
        queryParameters: {"CategoryId": category});

    if (response.isSuccess) {
      var data = TimeLineItemResponse.fromJson(response.value);
      StaticCache().setPosts(data.body, category);
      return Result.ok(data.body);
    }
    return Result.error(response.errorMessage, response.code);
  }

  void like(SnapQuery query) async {
    var url = CoreDataProvider().getBaseUrl() + "posts/${query.id}/likes";
    await broker.post(url, null, true);
  }

  Future<Result<List<BidItemBody>>> getBids(int id) async {
    var url = CoreDataProvider().getBaseUrl() + "posts/$id/bids";

    var response = await broker.fetch(url, authenticationRequired: true);

    if (response.isSuccess) {
      var data = BidItemsResponse.fromJson(response.value);
      return Result.ok(data.body);
    }
    return Result.error(response.errorMessage, response.code);
  }

  Future<Result<List<AppNotification>>> getNotifications({bool reload}) async {
    var url = CoreDataProvider().getBaseUrl() + "profile/notifications";

    var response = await broker.fetch(url, authenticationRequired: true);

    if (response.isSuccess) {
      var data = NotificationResponse.fromJson(response.value);
      return Result.ok(data.body);
    }
    return Result.error(response.errorMessage, response.code);
  }

  Future<Result<String>> acceptBid(SnapQuery query, Bid bid) async {
    var url = CoreDataProvider().getBaseUrl() +
        "posts/${query.id}/bids/${bid.id}/accept";

    var response = await broker.post(url, null, true);

    if (response.isSuccess) {
      return Result.ok("Bid accepted.");
    }
    return Result.error(response.errorMessage, response.code);
  }
}
