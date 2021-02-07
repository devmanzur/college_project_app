import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapkart_app/core/data/query_provider.dart';
import 'package:snapkart_app/core/models/snap_query.dart';
import 'package:snapkart_app/ui/pages/details/details_page.dart';
import 'package:snapkart_app/ui/pages/home/components/feed_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SnapQuery> _feeds = QueryProvider().getQueries();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
    Get.to(DetailsPage(feed));
  }
}
