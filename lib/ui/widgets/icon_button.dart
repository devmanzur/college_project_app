import 'package:flutter/material.dart';
import 'package:snapkart_app/utils/image_utils.dart';
import 'package:snapkart_app/utils/styles.dart';

import 'gaps.dart';

class MyIconButton extends StatelessWidget {
  final icon;
  final actionName;
  Function _onTap;

  MyIconButton(this.icon, this.actionName,this._onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Row(
        children: [
          Container(
            height: 18,
            width: 18,
            child: ImageIcon(
              ImageUtils.getAssetImage(icon),
              color: Colors.grey,
            ),
          ),
          Gaps.hGap4,
          Text(
            actionName,
            style: TextStyles.textSize12,
          ),
        ],
      ),
    );
  }
}
