import 'package:flutter/material.dart';
import 'package:snapkart_app/utils/styles.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String message;
  final String positiveBtnText;
  final String negativeBtnText;
  final Function onPositivePressed;
  final Function onNegativePressed;
  final double circularBorderRadius;

  CustomAlertDialog({
    this.title,
    this.message,
    this.circularBorderRadius = 15.0,
    this.bgColor = Colors.white,
    this.positiveBtnText,
    this.negativeBtnText,
    this.onPositivePressed,
    this.onNegativePressed,
  })  : assert(bgColor != null),
        assert(circularBorderRadius != null);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null
          ? Text(
              title,
              style: TextStyles.textBold18,
            )
          : null,
      content: message != null ? Text(message, style: TextStyles.textGray14,) : null,
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius)),
      actions: <Widget>[
        negativeBtnText != null
            ? FlatButton(
                child: Text(
                  negativeBtnText,
                  style: TextStyles.textBold14,
                ),
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onNegativePressed != null) {
                    onNegativePressed();
                  }
                },
              )
            : null,
        positiveBtnText != null
            ? FlatButton(
                child: Text(
                  positiveBtnText,
                  style: TextStyles.textBold14,
                ),
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  if (onPositivePressed != null) {
                    onPositivePressed();
                  }
                },
              )
            : null,
      ],
    );
  }
}
