import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_loader/screen_loader.dart';
import 'package:snapkart_app/core/models/app_notification.dart';
import 'package:snapkart_app/ui/pages/home/home_presenter.dart';
import 'package:snapkart_app/utils/styles.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage>
    with ScreenLoader<NotificationsPage> {
  var presenter = HomePresenter();
  List<AppNotification> _notifications = List<AppNotification>();

  @override
  Widget screen(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              dense: true,
              title: Text(_notifications[index].subject, style:  TextStyles.textBold14,),
              subtitle: Text(_notifications[index].message, style: TextStyles.textSize12,),
            ),
          );
        },
      ),
    ));
  }

  @override
  void initState() {
    loadItems();
  }

  Future<void> _onRefresh() async {
    await loadItems(reload: true);
  }

  Future loadItems({bool reload: false}) async {
    await this.performFuture(() => fetchNotifications(reload));
  }

  Future fetchNotifications(bool reload) async {
    var response = await presenter.getNotifications(reload: reload);
    if (response != null) {
      var notifications = response.value;
      if (response.value.length == 0) {
        Get.snackbar("Sorry", "No data found");
      }
      setState(() {
        _notifications = notifications;
      });
    } else {
      Get.snackbar("Sorry", "No data found");
    }
  }
}
