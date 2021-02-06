import 'package:flutter/cupertino.dart';
import 'package:snapkart_app/ui/widgets/custom_button.dart';
import 'package:snapkart_app/ui/widgets/custom_text_field.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/ui/widgets/load_image.dart';
import 'package:snapkart_app/ui/widgets/my_scroll_view.dart';
import 'package:snapkart_app/ui/widgets/text_field.dart';
import 'package:snapkart_app/utils/styles.dart';
import 'package:snapkart_app/utils/utils.dart';

class LoginForm extends StatelessWidget {
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  final Function onLoginSubmit;

  LoginForm(this.onLoginSubmit);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyScrollView(
      keyboardConfig: Utils.getKeyboardActionsConfig(
          context, <FocusNode>[_nodeText1, _nodeText2]),
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      children: _buildBody,
    );
  }

  List<Widget> get _buildBody => <Widget>[
        Gaps.hGap16,
        CustomTextField(
          focusNode: _nodeText1,
          controller: _phoneController,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          hintText: "Phone number",
        ),
        Gaps.vGap16,
        CustomTextField(
          focusNode: _nodeText2,
          isInputPwd: true,
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          maxLength: 16,
          hintText: "Password",
        ),
        Gaps.vGap16,
        CustomButton(
          key: const Key('login'),
          onPressed: (){
            onLoginSubmit(_phoneController.text,_passwordController.text);
          },
          text: "Login",
        ),
        Gaps.vGap16,

      ];
}
