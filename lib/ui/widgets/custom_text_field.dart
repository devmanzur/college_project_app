import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snapkart_app/utils/colours.dart';
import 'package:snapkart_app/utils/dimens.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final TextInputType keyboardType;
  final String hintText;
  final String initialValue;
  final FocusNode focusNode;
  final bool isInputPwd;
  final int maxLength;

  const CustomTextField(
      {this.controller,
      this.maxLength = 100,
      this.autoFocus = false,
      this.isInputPwd = false,
      this.keyboardType,
      this.hintText,
      this.initialValue,
      this.focusNode});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isShowDelete = false;
  bool _clickable = true;

  @override
  void initState() {
    super.initState();
    _isShowDelete = widget.controller.text.isEmpty;
    widget.controller.addListener(isEmpty);
  }

  void isEmpty() {
    bool isEmpty = widget.controller.text.isEmpty;
    if (isEmpty != _isShowDelete) {
      setState(() {
        _isShowDelete = isEmpty;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller?.removeListener(isEmpty);
  }

  List<TextInputFormatter> defaultInputFormatters() {
    return (widget.keyboardType == TextInputType.number ||
            widget.keyboardType == TextInputType.phone)
        ? [FilteringTextInputFormatter.allow(RegExp('[0-9]'))]
        : [FilteringTextInputFormatter.deny(RegExp('[\u4e00-\u9fa5]'))];
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focusNode,
      autofocus: widget.autoFocus,
      controller: widget.controller,
      obscureText: widget.isInputPwd,
      textInputAction: TextInputAction.next,
      inputFormatters: defaultInputFormatters(),
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.redAccent,
          ),
        ),
        isDense: true,
        fillColor: Colours.text_input_bg_color,
        filled: true,
        labelText: widget.hintText,
        labelStyle: TextStyle(
            fontSize: Dimens.font_sp12,
            color: Colours.color_text_hint,
            fontWeight: FontWeight.w600),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.deepPurpleAccent,
            )),
      ),
    );
  }
}
