import 'package:flutter/material.dart';
import 'package:snapkart_app/ui/widgets/custom_elevation.dart';
import 'package:snapkart_app/utils/colours.dart';
import 'package:snapkart_app/utils/dimens.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    this.text = '',
    @required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomElevation(
      height: 48,
      child: FlatButton(
        onPressed: onPressed,
        textColor: Colours.color_text_white,
        disabledTextColor: Colours.color_text_white,
        child: Container(
          height: 48,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
                fontSize: Dimens.font_sp16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
