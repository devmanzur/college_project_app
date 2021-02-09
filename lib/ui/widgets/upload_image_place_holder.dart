import 'package:flutter/material.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/utils/styles.dart';

class UploadImagePlaceHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_rounded, color: Colors.white,),
            Gaps.vGap8,
            Text("Upload Image", style: TextStyles.textWhite14Bold,),
          ],
        ),
      ),
    );
  }
}
