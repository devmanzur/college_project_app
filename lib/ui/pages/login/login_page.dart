import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_loader/screen_loader.dart';
import 'package:snapkart_app/application/data/core_data_provider.dart';
import 'package:snapkart_app/application/locator.dart';
import 'package:snapkart_app/application/services/core_data_service.dart';
import 'package:snapkart_app/ui/pages/home/home_page.dart';
import 'package:snapkart_app/ui/pages/login/components/LoginForm.dart';
import 'package:snapkart_app/ui/pages/login/login_presenter.dart';
import 'package:snapkart_app/ui/pages/register/register_page.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/ui/widgets/load_image.dart';
import 'package:snapkart_app/ui/widgets/my_scroll_view.dart';
import 'package:snapkart_app/utils/styles.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ScreenLoader<LoginPage> {
  var coreDataService = locator<CoreDataService>();
  var presenter = LoginPresenter();

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget screen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: MyScrollView(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gaps.vGap50,
            Center(
              child: Container(
                  width: 200, height: 200, child: LoadAssetImage('logo')),
            ),
            Gaps.vGap8,
            LoginForm(_onLoginButtonPressed),
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

  @override
  void initState() {
    setupBaseUrl();
  }

  void setupBaseUrl() async {
    var url = await coreDataService.getBaseUrl();
    CoreDataProvider().setBaseUrl(url);
  }

  void _onLoginButtonPressed(String phone, String password) async {
    if (phone.isEmpty || password.isEmpty) {
      Toast.show("Invalid phone number/ pin", context);
      return;
    }

    await this.performFuture(()=>loginWithCredentials(phone, password));
  }

  Future loginWithCredentials(String phone, String password) async {
     var login = await presenter.userLogin(phone, password);
    if (login.isSuccess) {
      Toast.show("successfully logged in", context);
      Get.offAll(()=>HomePage(), transition: Transition.rightToLeft);
    } else {
      Toast.show(login.errorMessage, context);
    }
  }
}

void _launchRegisterPage() {
  Get.to(() => RegisterPage(), transition: Transition.leftToRight);
}
