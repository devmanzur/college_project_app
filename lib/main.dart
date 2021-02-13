import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:snapkart_app/application/locator.dart';
import 'package:snapkart_app/ui/pages/login/login_page.dart';
import 'package:snapkart_app/utils/bad_certificate.dart';
import 'package:sp_util/sp_util.dart';

void main() async{
  HttpOverrides.global = new MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SpUtil.getInstance();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Snap Kart',
      theme: ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'Lato'),
      home: LoginPage(),
    );
  }
}
