import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapkart_app/core/data/query_provider.dart';
import 'package:snapkart_app/core/models/snap_query.dart';
import 'package:snapkart_app/ui/pages/create_query/create_query_page.dart';
import 'package:snapkart_app/ui/pages/details/details_page.dart';
import 'package:snapkart_app/ui/pages/home/components/feed_item.dart';
import 'package:snapkart_app/ui/widgets/load_image.dart';
import 'package:snapkart_app/utils/styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SnapQuery> _feeds = QueryProvider().getQueries();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(
          width: 140,
            child: LoadAssetImage('logo')),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add_box_outlined),
        label: Text(
          "Post",
          style: TextStyles.textBold14,
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
              return FeedItem(_feeds[index], _onItemClick);
            }),
      ),
    );
  }

  Future<void> _onRefresh() {
    Get.snackbar("Loading!", "Getting feeds from internet");
  }

  _onItemClick(SnapQuery feed) {
    Get.to(DetailsPage(feed), transition: Transition.rightToLeft);
  }
}

void _openPostCreateScreen() {
  Get.to(CreateQueryPage(),
      transition: Transition.leftToRight, fullscreenDialog: true);
}
