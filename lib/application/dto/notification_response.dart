
import 'package:snapkart_app/core/models/app_notification.dart';

class NotificationResponse {
  List<AppNotification> _body;
  dynamic _errors;
  String _timeGenerated;
  bool _isSuccess;

  List<AppNotification> get body => _body;
  dynamic get errors => _errors;
  String get timeGenerated => _timeGenerated;
  bool get isSuccess => _isSuccess;

  NotificationResponse({
    List<AppNotification> body,
    dynamic errors,
    String timeGenerated,
    bool isSuccess}){
    _body = body;
    _errors = errors;
    _timeGenerated = timeGenerated;
    _isSuccess = isSuccess;
  }

  NotificationResponse.fromJson(dynamic json) {
    if (json["body"] != null) {
      _body = [];
      json["body"].forEach((v) {
        _body.add(AppNotification.fromJson(v));
      });
    }
    _errors = json["errors"];
    _timeGenerated = json["timeGenerated"];
    _isSuccess = json["isSuccess"];
  }

}