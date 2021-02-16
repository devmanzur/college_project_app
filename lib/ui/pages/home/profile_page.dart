import 'package:flutter/material.dart';
import 'package:snapkart_app/ui/widgets/my_scroll_view.dart';
import 'package:snapkart_app/utils/styles.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 5.0,
          child: MyScrollView(
            children: [
              Text("Name:",style: TextStyles.textBold14),
              Text("Noushad Hasan",style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 18,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
