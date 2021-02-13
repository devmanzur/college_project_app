import 'package:snapkart_app/application/brokers/api_broker.dart';
import 'package:snapkart_app/application/data/core_data_provider.dart';
import 'package:snapkart_app/application/dto/bid_items_response.dart';
import 'package:snapkart_app/application/dto/result.dart';
import 'package:snapkart_app/application/dto/time_line_item.dart';
import 'package:snapkart_app/application/locator.dart';
import 'package:snapkart_app/core/models/snap_query.dart';

class HomePresenter {
  var broker = locator<ApiBroker>();

  Future<Result<List<PostResponse>>> getPosts() async {
    var url = CoreDataProvider().getBaseUrl() + "posts";

    var response = await broker.fetch(url, true);

    if (response.isSuccess) {
      var data = TimeLineItemResponse.fromJson(response.value);
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

    var response = await broker.fetch(url, true);

    if (response.isSuccess) {
      var data = BidItemsResponse.fromJson(response.value);
      return Result.ok(data.body);
    }
    return Result.error(response.errorMessage, response.code);
  }
}
