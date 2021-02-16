import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_loader/screen_loader.dart';
import 'package:snapkart_app/application/constants.dart';
import 'package:snapkart_app/core/models/bid.dart';
import 'package:snapkart_app/core/models/snap_query.dart';
import 'package:snapkart_app/ui/pages/details/components/bid_item.dart';
import 'package:snapkart_app/ui/pages/home/components/feed_item.dart';
import 'package:snapkart_app/ui/pages/home/home_presenter.dart';
import 'package:snapkart_app/ui/pages/post/create_bid/create_bid_page.dart';
import 'package:snapkart_app/ui/widgets/custom_button_alternate.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/ui/widgets/my_scroll_view.dart';
import 'package:snapkart_app/utils/styles.dart';
import 'package:sp_util/sp_util.dart';
import 'package:toast/toast.dart';

class DetailsPage extends StatefulWidget {
  final SnapQuery query;

  const DetailsPage(this.query);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with ScreenLoader<DetailsPage> {
  List<Bid> _bids = List<Bid>();
  var presenter = HomePresenter();

  Widget _getActionButton() {
    var userRole = SpUtil.getString(Constants.user_role_key);
    if (userRole == "Merchant") {
      return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _openBidScreen();
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      );
    }
    return null;
  }

  @override
  void initState() {
    loadBids();
  }

  Future loadBids() async {
    await this.performFuture(() => fetchBids());
  }

  Future fetchBids() async {
    var response = await presenter.getBids(widget.query.id);
    if (response != null && response.value.length > 0) {
      var bids = response.value.map((e) => Bid.from(e)).toList();
      setState(() {
        _bids = bids;
      });
    } else {
      // Toast.show("", context);
    }
  }

  @override
  Widget screen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.query.description.substring(0, 6).toString() + "...",
          style: TextStyles.textBold18White,
        ),
        centerTitle: true,
      ),
      floatingActionButton: _getActionButton(),
      body: MyScrollView(
        children: [
          FeedItem(widget.query, null, null, null),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _bids.length,
              itemBuilder: (context, index) {
                return BidItem(_bids[index],widget.query.acceptedBidId, _onBidClick);
              }),
        ],
      ),
    );
  }

  _onBidClick(Bid bid) {
    Get.defaultDialog(
      radius: 12,
      title: "Accept Bid?",
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Accept bid of ${bid.price} from ${bid.createdBy}",
              style: TextStyles.textStrong14,
            ),
            Gaps.vGap16,
          ],
        ),
      ),
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      onConfirm: () {
        _acceptBid(bid);
      },
    );
  }

  void _openBidScreen() {
    Get.to(CreateBidPage(widget.query),
        opaque: true,
        transition: Transition.rightToLeftWithFade,
        fullscreenDialog: true);
  }

  void _acceptBid(Bid bid) async {
    Get.back();
    var accept = await presenter.acceptBid(widget.query, bid);
    if (accept.isSuccess) {
      Get.snackbar("Success", "Bid accepted");
    }
  }
}
