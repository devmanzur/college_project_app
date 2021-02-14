import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_loader/screen_loader.dart';
import 'package:snapkart_app/core/models/area.dart';
import 'package:snapkart_app/core/models/category.dart';
import 'package:snapkart_app/core/models/city.dart';
import 'package:snapkart_app/ui/pages/login/login_presenter.dart';
import 'package:snapkart_app/ui/pages/register/components/customer_registration_form.dart';
import 'package:snapkart_app/ui/pages/register/components/merchant_registration_form.dart';
import 'package:snapkart_app/ui/pages/register/register_presenter.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/ui/widgets/my_scroll_view.dart';
import 'package:snapkart_app/utils/styles.dart';
import 'package:toast/toast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with ScreenLoader<RegisterPage> {
  bool _isVendor = false;
  var presenter = RegisterPresenter();

  @override
  Widget screen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Register now", style: TextStyles.textBold18),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MyScrollView(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Register as vendor?",
                    style: TextStyles.textBold14,
                  ),
                  Gaps.hGap8,
                  Switch(
                    onChanged: (isActive) {
                      setState(() {
                        _isVendor = isActive;
                      });
                    },
                    value: _isVendor,
                  ),
                ],
              ),
              Gaps.vGap16,
              _isVendor
                  ? MerchantRegistrationForm(_onMerchantSubmit)
                  : CustomerRegistrationFrom(_onCustomerRegisterSubmit)
            ],
          ),
        ),
      ),
    );
  }

  void _onCustomerRegisterSubmit(String name, String phone, String address,
      String password, String confirmPassword) async{
    if (name.isEmpty || phone.isEmpty || address.isEmpty || password.isEmpty) {
      Get.snackbar(
          "Error!", "Please insert phone number, name, address, password",
          margin: EdgeInsets.all(8));
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar("Error!", "Passwords do not match",
          margin: EdgeInsets.all(8));
      return;
    }

    await this.performFuture(()=>registerCustomer(name, phone, address, password));
  }

  void _onMerchantSubmit(
      String name,
      String phone,
      String address,
      String password,
      String confirmPassword,
      City city,
      Area area,
      List<Category> categories) async{
    if (name.isEmpty ||
        phone.isEmpty ||
        address.isEmpty ||
        password.isEmpty ||
        city == null ||
        area == null ||
        categories == null ||
        categories.isEmpty) {
      Get.snackbar("Error!", "Please fill all details",
          margin: EdgeInsets.all(8));
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar("Error!", "Passwords do not match",
          margin: EdgeInsets.all(8));
      return;
    }

    await this.performFuture(()=>registerMerchant(name, phone, address, password, city, area, categories));
  }

  void registerCustomer(
      String name, String phone, String address, String password) async {
    var registration = await presenter.registerCustomer(name, phone, address,
        password, "https://img.icons8.com/bubbles/2x/user-male.png");

    if (registration.isSuccess) {
      Toast.show("Registered!", context);
      Get.back();
    } else {
      Toast.show(registration.errorMessage, context);
    }
  }

  void registerMerchant(String name, String phone, String address,
      String password, City city, Area area, List<Category> categories) async {
    var registration = await presenter.registerMerchant(name, phone, address,
        password, "https://img.icons8.com/bubbles/2x/user-male.png",city.id,area.id,categories);

    if (registration.isSuccess) {
      Toast.show("Registered!", context);
      Get.back();
    } else {
      Toast.show(registration.errorMessage, context);
    }
  }
}
