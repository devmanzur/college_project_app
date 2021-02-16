class AppNotification{
  String userId;
  String subject;
  String message;
  int subjectId;

  AppNotification.fromJson(dynamic json) {
    userId = json["userId"];
    subject = json["subject"];
    message = json["message"];
    subjectId = json["subjectId"];
  }

}