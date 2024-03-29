import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snapkart_app/utils/colours.dart';
import 'dimens.dart';

class TextStyles {
  static const TextStyle textSize10 = TextStyle(
    fontSize: Dimens.font_sp10,
  );
  static const TextStyle textSize12 = TextStyle(
    fontSize: Dimens.font_sp12,
  );
  static const TextStyle textSize16 = TextStyle(
    fontSize: Dimens.font_sp16,
  );
  static const TextStyle textBold14 =
      TextStyle(fontSize: Dimens.font_sp14, fontWeight: FontWeight.bold);

  static const TextStyle textBold14White = TextStyle(
      fontSize: Dimens.font_sp14,
      fontWeight: FontWeight.bold,
      color: Colors.white);

  static const TextStyle textBold14Blue = TextStyle(
      fontSize: Dimens.font_sp14,
      fontWeight: FontWeight.bold,
      color: Colours.color_purple);

  static const TextStyle textBold12 =
      TextStyle(fontSize: Dimens.font_sp12, fontWeight: FontWeight.bold);

  static const TextStyle textStrong14 =
      TextStyle(fontSize: Dimens.font_sp14, fontWeight: FontWeight.w600);
  static const TextStyle textStrong16 = TextStyle(
    fontSize: Dimens.font_sp16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle textBold14Italic = TextStyle(
      fontSize: Dimens.font_sp14,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic);

  static const TextStyle textBold16 =
      TextStyle(fontSize: Dimens.font_sp16, fontWeight: FontWeight.bold);
  static const TextStyle textTitle16 =
      TextStyle(fontSize: Dimens.font_sp16, fontWeight: FontWeight.w600);
  static const TextStyle textBold18 =
      TextStyle(fontSize: Dimens.font_sp18, fontWeight: FontWeight.bold,color: Colors.black87);
  static const TextStyle textBold18White =
      TextStyle(fontSize: Dimens.font_sp18, fontWeight: FontWeight.bold,color: Colors.white);
  static const TextStyle textBold24 =
      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);
  static const TextStyle textBold26 =
      TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold);
  static const TextStyle textBold32 =
      TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold);

  static const TextStyle textBold28 = TextStyle(
      fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black);

  static const TextStyle textWhite14 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colors.white,
  );
  static const TextStyle textWhite14Bold = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textWhite18Bold = TextStyle(
    fontSize: Dimens.font_sp18,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textWhite12 = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colors.white,
  );
  static const TextStyle textWhite10 = TextStyle(
    fontSize: Dimens.font_sp10,
    color: Colors.white,
  );
  static const TextStyle textWhite12Bold = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textWhite12Strong = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle text = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.text,
      textBaseline: TextBaseline.alphabetic);

  static const TextStyle textDark = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.dark_text,
      textBaseline: TextBaseline.alphabetic);

  static const TextStyle textGray13 = TextStyle(
      fontSize: Dimens.font_sp13,
      color: Colours.text_gray,
      fontWeight: FontWeight.normal);

  static const TextStyle textGray14 = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.text_gray,
      fontWeight: FontWeight.normal);

  static const TextStyle textGray16 = TextStyle(
      fontSize: Dimens.font_sp16,
      color: Colours.text_gray,
      fontWeight: FontWeight.normal);
  static const TextStyle textDarkGray12 = TextStyle(
      fontSize: Dimens.font_sp12,
      color: Colours.dark_text_gray,
      fontWeight: FontWeight.normal);
}
