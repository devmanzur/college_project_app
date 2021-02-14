import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_loader/screen_loader.dart';
import 'package:snapkart_app/core/models/snap_query.dart';
import 'package:snapkart_app/ui/pages/post/post_presenter.dart';
import 'package:snapkart_app/ui/widgets/custom_button.dart';
import 'package:snapkart_app/ui/widgets/custom_text_field.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/ui/widgets/my_scroll_view.dart';
import 'package:snapkart_app/ui/widgets/select_image.dart';
import 'package:snapkart_app/utils/styles.dart';
import 'package:toast/toast.dart';

class CreateBidPage extends StatefulWidget {
  final SnapQuery query;

  CreateBidPage(this.query);

  @override
  _CreateBidPageState createState() => _CreateBidPageState();
}

class _CreateBidPageState extends State<CreateBidPage>
    with ScreenLoader<CreateBidPage> {
  var presenter = PostPresenter();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  File _imageFile;

  @override
  Widget screen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Make bid",
          style: TextStyles.textBold18White,
        ),
        centerTitle: true,
      ),
      body: MyScrollView(
        padding: EdgeInsets.all(12),
        children: [
          Container(
              color: Colors.black,
              margin: EdgeInsets.all(16),
              height: Get.width / 2,
              width: Get.width,
              child: SelectImageHolder(_onImageSelected)),
          Gaps.vGap16,
          CustomTextField(
            controller: _descriptionController,
            hintText: "Describe your offer",
          ),
          Gaps.vGap16,
          CustomTextField(
            controller: _priceController,
            hintText: "Price",
            keyboardType: TextInputType.number,
          ),
          Gaps.vGap16,
          CustomButton(
            text: "Submit",
            onPressed: _onSubmitPressed,
          )
        ],
      ),
    );
  }

  void _onSubmitPressed() async {
    var price = _priceController.text;
    var details = _descriptionController.text;
    if (price.isEmpty || details.isEmpty || _imageFile == null) {
      Toast.show("Please input all data", context);
      return;
    }
    await this.performFuture(() => makeBid(price, details));
  }

  void _onImageSelected(File image) {
    _imageFile = image;
  }

  void makeBid(String price, String details) async {
    var response = await presenter.makeBid(
        widget.query, _imageFile, double.parse(price), details);
    if (response.isSuccess) {
      Toast.show("Your bid has been submitted!", context);
      Get.back();
    } else {
      Toast.show(response.errorMessage, context);
    }
  }
}
