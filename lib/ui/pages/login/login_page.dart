import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapkart_app/ui/pages/login/components/LoginForm.dart';
import 'package:snapkart_app/ui/pages/register/register_page.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/ui/widgets/load_image.dart';
import 'package:snapkart_app/ui/widgets/my_scroll_view.dart';
import 'package:snapkart_app/utils/styles.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: MyScrollView(
              crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gaps.vGap32,
            Center(
              child: Container(
                  width: 160, height: 100, child: LoadAssetImage('logo')),
            ),
            Text(
              "Welcome back!",
              style: TextStyles.textBold26,
            ),
            Gaps.vGap8,
            Text(
              "We are so excited to see you again!",
              style: TextStyles.textGray14,
            ),
            Gaps.vGap8,
            LoginForm(_onLoginSubmit),
            Gaps.vGap4,
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Text(
                    "Need an account?",
                    style: TextStyles.textGray14,
                  ),
                  Gaps.hGap8,
                  GestureDetector(
                    child: Text(
                      "Register",
                      key: const Key('noAccountRegister'),
                      style: TextStyles.textBold14Blue,
                    ),
                    onTap: () {
                      _launchRegisterPage();
                    },
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

void _onLoginSubmit(String phone, String password) {
  Get.snackbar("Error!", "Please insert phone number and password",
      snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(8));
}

void _launchRegisterPage() {
  Get.to(RegisterPage(), transition: Transition.leftToRight);
}
