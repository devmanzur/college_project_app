import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_loader/screen_loader.dart';
import 'package:snapkart_app/core/models/snap_query.dart';
import 'package:snapkart_app/ui/pages/details/details_page.dart';
import 'package:snapkart_app/ui/pages/home/components/feed_item.dart';
import 'package:snapkart_app/ui/pages/home/home_presenter.dart';
import 'package:snapkart_app/ui/pages/post/create_bid/create_bid_page.dart';
import 'package:toast/toast.dart';

class TimeLinePage extends StatefulWidget {
  final int categoryId;
  TimeLinePage({this.categoryId});

  @override
  _TimeLinePageState createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage>
    with ScreenLoader<TimeLinePage> {
  var presenter = HomePresenter();
  List<SnapQuery> _feeds = List<SnapQuery>();

  @override
  Widget screen(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        itemCount: _feeds.length,
        itemBuilder: (context, index) {
          return FeedItem(
              _feeds[index], _onItemClick, _onPostLiked, _onPostBidClicked);
        },
      ),
    ));
  }

  @override
  void initState() {
    loadItems();
  }

  _onItemClick(SnapQuery feed) {
    Get.to(DetailsPage(feed), transition: Transition.rightToLeft);
  }

  _onPostBidClicked(SnapQuery query) {
    Get.to(CreateBidPage(query));
  }

  _onPostLiked(SnapQuery query) {
    presenter.like(query);
  }

  Future fetchPosts(bool reload) async {
    var response = await presenter.getPosts(
        category: widget.categoryId??0,
        reload: reload);
    if (response != null) {
      var feeds = response.value.map((e) => SnapQuery.from(e)).toList();
      if (response.value.length == 0) {
        Get.snackbar("Sorry", "No data found");
      }
      setState(() {
        _feeds = feeds;
      });
    } else {
      Get.snackbar("Sorry", "No data found");
    }
  }

  Future<void> _onRefresh() async {
    await loadItems(reload: true);
  }

  Future loadItems({bool reload: false}) async {
    await this.performFuture(() => fetchPosts(reload));
  }
}
