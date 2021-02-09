import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapkart_app/ui/widgets/custom_button.dart';
import 'package:snapkart_app/ui/widgets/custom_text_field.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/ui/widgets/my_scroll_view.dart';
import 'package:snapkart_app/ui/widgets/select_image.dart';
import 'package:snapkart_app/utils/styles.dart';

class CreateBidPage extends StatefulWidget {
  @override
  _CreateBidPageState createState() => _CreateBidPageState();
}

class _CreateBidPageState extends State<CreateBidPage> {
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              child: SelectImageHolder()),
          Gaps.vGap16,
          CustomTextField(
            controller: _descriptionController,
            hintText: "Describe your offer",
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

  void _onSubmitPressed() {}
}
