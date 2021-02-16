import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapkart_app/application/constants.dart';
import 'package:snapkart_app/ui/pages/home/categories_page.dart';
import 'package:snapkart_app/ui/pages/home/components/bottom_appbar_navigation.dart';
import 'package:snapkart_app/ui/pages/home/more_options_page.dart';
import 'package:snapkart_app/ui/pages/home/notification_page.dart';
import 'package:snapkart_app/ui/pages/home/time_line_page.dart';
import 'package:snapkart_app/ui/pages/post/create_query/create_query_page.dart';
import 'package:snapkart_app/ui/widgets/load_image.dart';
import 'package:sp_util/sp_util.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;

  var _pages = [
    TimeLinePage(),
    CategoriesPage(),
    NotificationsPage(),
    MoreOptionsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(width: 140, child: LoadAssetImage('logo_mini')),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_bag_rounded),
        onPressed: () {
          _openPostCreateScreen();
        },
      ),
      bottomNavigationBar: MyBottomAppBar(
        onTabSelected: _onTabSelected,
        items: [
          MyBottomAppBarItem(iconData: Icons.home_outlined, text: 'Home'),
          MyBottomAppBarItem(
              iconData: Icons.category_outlined, text: 'Categories'),
          MyBottomAppBarItem(
              iconData: Icons.notifications_none_outlined,
              text: 'Notifications'),
          MyBottomAppBarItem(iconData: Icons.menu_outlined, text: 'More'),
        ],
        notchedShape: CircularNotchedRectangle(),
      ),
      body: _pages[_selectedTab],
    );
  }

  void _onTabSelected(int index) {
    setState(() {
      // if (index > 1) {
      //   index -= 1;
      // }
      _selectedTab = index;
    });
  }

  void _openPostCreateScreen() {
    var userRole = SpUtil.getString(Constants.user_role_key);
    if (userRole == "Merchant") {
      Toast.show("Coming soon", context);
      return;
    }

    Get.to(CreateQueryPage(),
        transition: Transition.leftToRight, fullscreenDialog: true);
  }
}
