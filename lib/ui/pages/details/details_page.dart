import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapkart_app/core/data/query_provider.dart';
import 'package:snapkart_app/core/models/bid.dart';
import 'package:snapkart_app/core/models/snap_query.dart';
import 'package:snapkart_app/ui/pages/create_bid/create_bid_page.dart';
import 'package:snapkart_app/ui/pages/details/components/bid_item.dart';
import 'package:snapkart_app/ui/pages/home/components/feed_item.dart';
import 'package:snapkart_app/ui/widgets/my_scroll_view.dart';
import 'package:snapkart_app/utils/styles.dart';

class DetailsPage extends StatefulWidget {
  final SnapQuery query;

  const DetailsPage(this.query);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Bid> _bids = QueryProvider().getBids();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.query.description.substring(0,6).toString()+"...",
          style: TextStyles.textBold18White,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _openBidScreen();
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      ),
      body: MyScrollView(
        children: [
          FeedItem(widget.query, null),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _bids.length,
              itemBuilder: (context, index) {
                return BidItem(_bids[index], _onBidClick);
              }),
        ],
      ),
    );
  }

  _onBidClick(Bid bid) {
    Get.snackbar("Accept?", bid.price.toString());
  }
}

void _openBidScreen() {
  Get.to(CreateBidPage(),
      opaque: true,
      transition: Transition.rightToLeftWithFade,
      fullscreenDialog: true);
}
