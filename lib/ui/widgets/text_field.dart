import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/ui/widgets/load_image.dart';
import 'package:snapkart_app/utils/colours.dart';
import 'package:snapkart_app/utils/styles.dart';

class MyTextField extends StatefulWidget {
  const MyTextField(
      {Key key,
      @required this.controller,
      this.maxLength = 100,
      this.autoFocus = false,
      this.inputFormatterList,
      this.keyboardType = TextInputType.text,
      this.hintText = '',
      this.focusNode,
      this.isInputPwd = false,
      this.performAction,
      this.actionName,
      this.duration = 60,
      this.keyName})
      : super(key: key);

  final TextEditingController controller;
  final int maxLength;
  final int duration;
  final bool autoFocus;
  final TextInputType keyboardType;
  final String hintText;
  final String actionName;
  final FocusNode focusNode;
  final bool isInputPwd;
  final Future<bool> Function() performAction;
  final List<TextInputFormatter> inputFormatterList;
  final String keyName;

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _isShowPwd = false;
  bool _isShowDelete = false;
  bool _clickable = true;
  int _currentSecond;
  StreamSubscription _subscription;

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
    _subscription?.cancel();
    widget.controller?.removeListener(isEmpty);
  }

  Future _getVCode() async {
    bool isSuccess = await widget.performAction();
    if (isSuccess != null && isSuccess) {
      setState(() {
        _currentSecond = widget.duration;
        _clickable = false;
      });
      _subscription = Stream.periodic(const Duration(seconds: 1), (int i) => i)
          .take(widget.duration)
          .listen((int i) {
        setState(() {
          _currentSecond = widget.duration - i - 1;
          _clickable = _currentSecond < 1;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final bool isDark = themeData.brightness == Brightness.dark;
    final TextField textField = TextField(
      focusNode: widget.focusNode,
      maxLength: widget.maxLength,
      obscureText: widget.isInputPwd ? !_isShowPwd : false,
      autofocus: widget.autoFocus,
      controller: widget.controller,
      textInputAction: TextInputAction.done,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatterList == null
          ? defaultInputFormatters()
          : widget.inputFormatterList,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
        hintText: widget.hintText,
        counterText: '',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: themeData.primaryColor,
            width: 0.8,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colours.color_grey_blue,
            width: 0.8,
          ),
        ),
      ),
    );

    Widget clear = Semantics(
      label: 'Clear',
      hint: 'Clear the input box',
      child: GestureDetector(
        child: LoadAssetImage(
          'login/qyg_shop_icon_delete',
          key: Key('${widget.keyName}_delete'),
          width: 18.0,
          height: 40.0,
        ),
        onTap: () => widget.controller.text = '',
      ),
    );

    Widget pwdVisible = Semantics(
      label: 'Show password',
      hint: 'Show password',
      child: GestureDetector(
        child: LoadAssetImage(
          _isShowPwd
              ? 'login/qyg_shop_icon_display'
              : 'login/qyg_shop_icon_hide',
          key: Key('${widget.keyName}_showPwd'),
          width: 18.0,
          height: 40.0,
        ),
        onTap: () {
          setState(() {
            _isShowPwd = !_isShowPwd;
          });
        },
      ),
    );

    Widget getVCodeButton = Theme(
      data: Theme.of(context).copyWith(
        buttonTheme: const ButtonThemeData(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          height: 26.0,
          minWidth: 76.0,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
      child: FlatButton(
        key: const Key('getVerificationCode'),
        onPressed: _clickable ? _getVCode : null,
        textColor: themeData.primaryColor,
        color: Colors.transparent,
        disabledTextColor: isDark ? Colours.dark_text : Colors.white,
        disabledColor: isDark ? Colours.dark_text_gray : Colours.text_gray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.0),
          side: BorderSide(
            color: _clickable ? themeData.primaryColor : Colors.transparent,
            width: 0.8,
          ),
        ),
        child: Text(
          _clickable
              ? widget.actionName?.toUpperCase() ??
                  "Verification Code"
              : '（$_currentSecond s）',
          style: TextStyles.textSize10,
        ),
      ),
    );

    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        textField,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (_isShowDelete) Gaps.empty else clear,
            if (!widget.isInputPwd) Gaps.empty else Gaps.hGap15,
            if (!widget.isInputPwd) Gaps.empty else pwdVisible,
            if (widget.performAction == null) Gaps.empty else Gaps.hGap15,
            if (widget.performAction == null) Gaps.empty else getVCodeButton,
          ],
        )
      ],
    );
  }

  List<TextInputFormatter> defaultInputFormatters() {
    return (widget.keyboardType == TextInputType.number ||
            widget.keyboardType == TextInputType.phone)
        ? [WhitelistingTextInputFormatter(RegExp('[0-9]'))]
        : [BlacklistingTextInputFormatter(RegExp('[\u4e00-\u9fa5]'))];
  }
}
