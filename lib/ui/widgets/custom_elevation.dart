import 'package:flutter/material.dart';
import 'package:snapkart_app/utils/colours.dart';

class CustomElevation extends StatelessWidget {
  final Widget child;
  final double height;

  CustomElevation({@required this.child, @required this.height})
      : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colours.color_light_purple, Colours.color_purple],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(48.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colours.color_light_purple.withOpacity(0.4),
            blurRadius: height / 5,
            offset: Offset(0, height / 5),
          ),
        ],
      ),
      child: this.child,
    );
  }
}