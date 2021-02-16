import 'package:flutter/material.dart';
import 'package:snapkart_app/utils/colours.dart';
import 'package:snapkart_app/utils/dimens.dart';

class CustomButtonAlternate extends StatelessWidget {
  const CustomButtonAlternate({
    Key key,
    this.text = '',
    @required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      textColor: Colours.color_purple,
      disabledTextColor: Colours.color_purple,
      color: Colours.color_grey_blue,
      disabledColor: Colours.color_grey_blue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(48.0))),
      child: Container(
        height: 48,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
              fontSize: Dimens.font_sp16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class CustomButtonAlternateSmall extends StatelessWidget {
  const CustomButtonAlternateSmall({
    Key key,
    this.text = '',
    @required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      textColor: Colours.color_purple,
      disabledTextColor: Colours.color_purple,
      color: Colours.color_grey_blue,
      disabledColor: Colours.color_grey_blue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(48.0))),
      child: Container(
        height: 24,
        width: 48,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
              fontSize: Dimens.font_sp12, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}