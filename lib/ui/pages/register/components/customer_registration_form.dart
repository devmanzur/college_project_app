import 'package:flutter/material.dart';
import 'package:snapkart_app/ui/widgets/custom_button.dart';
import 'package:snapkart_app/ui/widgets/custom_text_field.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/ui/widgets/my_scroll_view.dart';
import 'package:snapkart_app/utils/utils.dart';

class CustomerRegistrationFrom extends StatelessWidget {
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  final FocusNode _nodeText4 = FocusNode();
  final FocusNode _nodeText5 = FocusNode();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  final Function onRegisterSubmit;

  CustomerRegistrationFrom(this.onRegisterSubmit);

  @override
  Widget build(BuildContext context) {
    return MyScrollView(
      keyboardConfig: Utils.getKeyboardActionsConfig(
          context, <FocusNode>[_nodeText1, _nodeText2, _nodeText3, _nodeText4, _nodeText5]),
      children: [
        CustomTextField(
          focusNode: _nodeText1,
          controller: _nameController,
          maxLength: 50,
          keyboardType: TextInputType.text,
          hintText: "Name",
        ),
        Gaps.vGap16,
        CustomTextField(
          focusNode: _nodeText2,
          controller: _phoneController,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          hintText: "Phone number",
        ),
        Gaps.vGap16,
        CustomTextField(
          focusNode: _nodeText3,
          controller: _addressController,
          maxLength: 100,
          keyboardType: TextInputType.streetAddress,
          hintText: "Address",
        ),
        Gaps.vGap16,
        CustomTextField(
          focusNode: _nodeText4,
          isInputPwd: true,
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          maxLength: 16,
          hintText: "Password",
        ),
        Gaps.vGap16,
        CustomTextField(
          focusNode: _nodeText5,
          isInputPwd: true,
          controller: _passwordConfirmController,
          keyboardType: TextInputType.visiblePassword,
          maxLength: 16,
          hintText: "Confirm Password",
        ),
        Gaps.vGap16,
        CustomButton(
          key: const Key('register'),
          onPressed: (){
            onRegisterSubmit(_nameController.text,_phoneController.text,_addressController.text,_passwordController.text,_passwordConfirmController.text);
          },
          text: "Register",
        ),
        Gaps.vGap16,
      ],
    );
  }
}
