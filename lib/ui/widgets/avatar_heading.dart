import 'package:flutter/material.dart';
import 'package:snapkart_app/utils/image_utils.dart';
import 'package:snapkart_app/utils/styles.dart';

class AvatarHeading extends StatelessWidget {
  final String subTitle;
  final String title;
  final String imageUrl;


  AvatarHeading(this.imageUrl,this.title,this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const SizedBox(width: double.infinity, height: 64.0),
        Positioned(
          left: 0.0,
          child: CircleAvatar(
            radius: 24.0,
            backgroundColor: Colors.transparent,
            backgroundImage: ImageUtils.getImageProvider(
                imageUrl,
                holderImg: 'appuseravatar'),
            onBackgroundImageError: (dynamic, stacktrace) {},
          ),
        ),
        Positioned(
            left: 56,
            top: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.textBold12,
                ),
                Text(
                  subTitle,
                  style: TextStyles.textGray14,
                ),
              ],
            )),
      ],
    );
  }
}
