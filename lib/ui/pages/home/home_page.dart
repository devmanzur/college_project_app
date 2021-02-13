import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapkart_app/core/models/snap_query.dart';
import 'package:snapkart_app/ui/pages/details/details_page.dart';
import 'package:snapkart_app/ui/pages/home/components/feed_item.dart';
import 'package:snapkart_app/ui/pages/home/home_presenter.dart';
import 'package:snapkart_app/ui/pages/post/create_bid/create_bid_page.dart';
import 'package:snapkart_app/ui/pages/post/create_query/create_query_page.dart';
import 'package:snapkart_app/ui/widgets/load_image.dart';
import 'package:snapkart_app/utils/styles.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SnapQuery> _feeds = List<SnapQuery>();
  var presenter = HomePresenter();

  @override
  void initState() {
    loadItems();
  }

  Future loadItems() async {
    var response = await presenter.getPosts();
    if (response != null && response.value.length > 0) {
      var feeds = response.value.map((e) => SnapQuery.from(e)).toList();
      setState(() {
        _feeds = feeds;
      });
    }else{
      Toast.show("No data found!", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(width: 140, child: LoadAssetImage('logo_mini')),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.edit),
        label: Text(
          "Post",
          style: TextStyles.textBold16,
        ),
        onPressed: () {
          _openPostCreateScreen();
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
            itemCount: _feeds.length,
            itemBuilder: (context, index) {
              return FeedItem(_feeds[index], _onItemClick,_onPostLiked, _onPostBidClicked);
            }),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await loadItems();
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
}

void _openPostCreateScreen() {
  Get.to(CreateQueryPage(),
      transition: Transition.leftToRight, fullscreenDialog: true);
}
