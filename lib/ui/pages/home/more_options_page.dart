import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapkart_app/application/data/static_cache.dart';
import 'package:snapkart_app/ui/pages/home/profile_page.dart';
import 'package:snapkart_app/ui/pages/login/login_page.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/ui/widgets/my_scroll_view.dart';
import 'package:snapkart_app/utils/styles.dart';
import 'package:sp_util/sp_util.dart';
import 'package:toast/toast.dart';

class MoreOptionsPage extends StatefulWidget {
  @override
  _MoreOptionsPageState createState() => _MoreOptionsPageState();
}

class _MoreOptionsPageState extends State<MoreOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MyScrollView(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildBody,
    ));
  }

  List<Widget> get _buildBody => <Widget>[
        FlatButton(
          child: Row(
            children: [
              Icon(Icons.account_circle),
              Gaps.hGap12,
              Text(
                "View profile",
                style: TextStyles.textSize12,
              ),
            ],
          ),
          onPressed: () {
            _showProfileScreen();
          },
        ),
        Gaps.line,
        Gaps.vGap8,
        FlatButton(
          child: Row(
            children: [
              Icon(Icons.phonelink_lock),
              Gaps.hGap12,
              Text(
                "Security",
                style: TextStyles.textSize12,
              ),
            ],
          ),
          onPressed: () {
            _showSecurityScreen();
          },
        ),
        Gaps.vGap8,
        FlatButton(
          child: Row(
            children: [
              Icon(Icons.help_outline),
              Gaps.hGap12,
              Text(
                "Help",
                style: TextStyles.textSize12,
              ),
            ],
          ),
          onPressed: () {
            _dummyAction();
          },
        ),
        Gaps.vGap8,
        FlatButton(
          child: Row(
            children: [
              Icon(Icons.local_offer),
              Gaps.hGap12,
              Text(
                "Promotions",
                style: TextStyles.textSize12,
              ),
            ],
          ),
          onPressed: () {
            _dummyAction();
          },
        ),
        Gaps.vGap8,
        FlatButton(
          child: Row(
            children: [
              Icon(Icons.settings),
              Gaps.hGap12,
              Text(
                "Settings",
                style: TextStyles.textSize12,
              ),
            ],
          ),
          onPressed: () {
            _dummyAction();
          },
        ),
        Gaps.vGap8,
        FlatButton(
          child: Row(
            children: [
              Icon(Icons.card_giftcard),
              Gaps.hGap12,
              Text(
                "Invite friends",
                style: TextStyles.textSize12,
              ),
            ],
          ),
          onPressed: () {
            _dummyAction();
          },
        ),
        Gaps.vGap8,
        FlatButton(
          child: Row(
            children: [
              Icon(Icons.info_outline),
              Gaps.hGap12,
              Text(
                "About us",
                style: TextStyles.textSize12,
              ),
            ],
          ),
          onPressed: () {
            _dummyAction();
          },
        ),
        Gaps.vGap8,
        FlatButton(
          child: Row(
            children: [
              Icon(Icons.exit_to_app),
              Gaps.hGap12,
              Text(
                "Log out",
                style: TextStyles.textSize12,
              ),
            ],
          ),
          onPressed: () {
            _logOut();
          },
        ),
      ];

  void _logOut() async {
    await SpUtil.clear();
    StaticCache().clear();
    Get.offAll(() => LoginPage());
  }

  void _dummyAction() {}

  void _showSecurityScreen() {}

  void _showProfileScreen() {
    Get.to(() => ProfilePage());
  }
}
