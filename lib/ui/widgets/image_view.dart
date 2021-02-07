import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyImageView extends StatelessWidget {

  final String imageUrl;

  const MyImageView(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
