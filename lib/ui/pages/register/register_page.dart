import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapkart_app/core/models/area.dart';
import 'package:snapkart_app/core/models/category.dart';
import 'package:snapkart_app/core/models/city.dart';
import 'package:snapkart_app/ui/pages/register/components/customer_registration_form.dart';
import 'package:snapkart_app/ui/pages/register/components/merchant_registration_form.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/ui/widgets/my_scroll_view.dart';
import 'package:snapkart_app/utils/styles.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isVendor =  false;

  @override
  Widget build(BuildContext context) {
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

  void _onCustomerRegisterSubmit(
      String name, String phone, String address, String password) {
    Get.snackbar(
        "Error!", "Please insert phone number, name, address, password",
         margin: EdgeInsets.all(8));
  }

  void _onMerchantSubmit(
      String name, String phone, String address, String password, City city, Area area,List<Category> categories) {
    Get.snackbar(
        "Error!", "Please insert merchant details",
         margin: EdgeInsets.all(8));
  }
}
