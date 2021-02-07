import 'package:flutter/material.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/utils/image_utils.dart';
import 'package:snapkart_app/utils/styles.dart';

class AvatarHeadingSmall extends StatelessWidget {
  final String subTitle;
  final String title;
  final String imageUrl;


  AvatarHeadingSmall(this.imageUrl,this.title,this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const SizedBox(width: double.infinity, height: 48.0),
        Positioned(
          left: 0.0,
          child: CircleAvatar(
            radius: 18.0,
            backgroundColor: Colors.transparent,
            backgroundImage: ImageUtils.getImageProvider(
                imageUrl,
                holderImg: 'appuseravatar'),
            onBackgroundImageError: (dynamic, stacktrace) {},
          ),
        ),
        Positioned(
            left: 36,
            top: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.textSize12,
                ),
                Gaps.vGap4,
                Text(
                  subTitle,
                  style: TextStyles.textSize10,
                ),
              ],
            )),
      ],
    );
  }
}
