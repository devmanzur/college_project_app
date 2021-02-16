import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:snapkart_app/core/models/bid.dart';
import 'package:snapkart_app/ui/widgets/avatar_heading.dart';
import 'package:snapkart_app/ui/widgets/avatar_heading_small.dart';
import 'package:snapkart_app/ui/widgets/custom_button_alternate.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/ui/widgets/image_view.dart';
import 'package:snapkart_app/utils/styles.dart';

class BidItem extends StatelessWidget {
  final Bid bid;
  final Function onClick;
  final int acceptedBid;

  BidItem(this.bid, this.acceptedBid, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                onClick(bid);
              },
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AvatarHeadingSmall(bid.userImageUrl, bid.createdBy,
                        "BDT " + bid.price.toString()),
                    Text(
                      bid.description,
                      style: TextStyles.textSize12,
                    ),
                    Gaps.vGap16,
                    buildTrailingWidget()
                  ]),
            ),
            Positioned(
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Get.to(MyImageView(bid.imageUrl));
                },
                child: Container(
                  height: 72,
                  width: 72,
                  child: CachedNetworkImage(
                    imageUrl: bid.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTrailingWidget() {
    if (acceptedBid == bid.id) {
      return Icon(
        Icons.favorite,
        color: Colors.red,
      );
    }
    return CustomButtonAlternateSmall(
      onPressed: () {
        onClick(bid);
      },
      text: "Accept",
    );
  }
}
