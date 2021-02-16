import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapkart_app/core/models/snap_query.dart';
import 'package:snapkart_app/ui/widgets/avatar_heading.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/ui/widgets/icon_button.dart';
import 'package:snapkart_app/utils/styles.dart';

class FeedItem extends StatelessWidget {
  final SnapQuery query;
  final Function _onItemClick;
  final Function _onLikeButtonClicked;
  final Function _onBidButtonClick;

  FeedItem(this.query, this._onItemClick, this._onLikeButtonClicked, this._onBidButtonClick);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              _onItemClick(query);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarHeading(
                    query.userImageUrl, query.createdBy, query.location),
                Container(
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: query.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gaps.vGap12,
                Text(
                  query.description,
                  style: TextStyles.textSize12,
                ),
              ],
            ),
          ),
          Gaps.vGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                query.likes.toString(),
                style: TextStyles.textSize12,
              ),
              Gaps.hGap4,
              Text(
                "Likes",
                style: TextStyles.textSize12,
              ),
              Gaps.hGap8,
              Text(
                query.bids.toString(),
                style: TextStyles.textSize12,
              ),
              Gaps.hGap4,
              Text(
                "Bids",
                style: TextStyles.textSize12,
              ),
            ],
          ),
          Gaps.vGap4,
          Gaps.line,
          Gaps.vGap4,
          Row(
            children: [
              MyIconButton("like", "Like", _onLikeClicked),
              // Gaps.hGap16,
              // MyIconButton("bid", "Bid", _onBidClicked),
            ],
          )
        ]),
      ),
    );
  }

  _onLikeClicked() {
    _onLikeButtonClicked(query);
  }

  _onBidClicked() {
    _onBidButtonClick(query);
  }
}
