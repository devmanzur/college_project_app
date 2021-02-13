import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapkart_app/core/models/bid.dart';
import 'package:snapkart_app/core/models/snap_query.dart';
import 'package:snapkart_app/ui/pages/details/components/bid_item.dart';
import 'package:snapkart_app/ui/pages/home/components/feed_item.dart';
import 'package:snapkart_app/ui/pages/home/home_presenter.dart';
import 'package:snapkart_app/ui/pages/post/create_bid/create_bid_page.dart';
import 'package:snapkart_app/ui/widgets/my_scroll_view.dart';
import 'package:snapkart_app/utils/styles.dart';
import 'package:toast/toast.dart';

class DetailsPage extends StatefulWidget {
  final SnapQuery query;

  const DetailsPage(this.query);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Bid> _bids = List<Bid>();
  var presenter = HomePresenter();

  @override
  void initState() {
    loadBids();
  }

  Future loadBids() async {
    var response = await presenter.getBids(widget.query.id);
    if (response != null && response.value.length > 0) {
      var bids = response.value.map((e) => Bid.from(e)).toList();
      setState(() {
        _bids = bids;
      });
    }else{
      Toast.show("No data found!", context);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.query.description.substring(0, 6).toString() + "...",
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
          FeedItem(widget.query, null, null, null),
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

  void _openBidScreen() {
    Get.to(CreateBidPage(widget.query),
        opaque: true,
        transition: Transition.rightToLeftWithFade,
        fullscreenDialog: true);
  }
}
