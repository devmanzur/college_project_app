import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:snapkart_app/ui/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Snap Kart',
      theme: ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'Lato'),
      home: LoginPage(),
    );
  }
}
