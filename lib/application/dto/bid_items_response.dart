/// body : [{"createdAt":"2021-02-06T03:27:20.754361+06:00","imageUrl":"2345678.png","description":"item + servicing","createdBy":"Manzur Alahi","userImageUrl":"1234567890.png","price":650,"id":1},{"createdAt":"2021-02-06T04:05:28.278527+06:00","imageUrl":"23456789.png","description":"Body + Servicing","createdBy":"Bismillah Service Center","userImageUrl":"876543.png","price":500,"id":2},{"createdAt":"2021-02-14T03:40:21.454934+06:00","imageUrl":"Instance of 'Result<Null>'","description":"Best!","createdBy":"My Dream Shop","userImageUrl":"https://img.icons8.com/bubbles/2x/user-male.png","price":1500,"id":3},{"createdAt":"2021-02-14T03:43:49.10771+06:00","imageUrl":"https://firebasestorage.googleapis.com/v0/b/snapkart-cf28d.appspot.com/o/images%2F2021-02-14T03%3A43%3A02.956261.jpeg?alt=media&token=1cd3a9b7-0bd5-4b5d-a67c-d07e37506687","description":"sahdajdakj","createdBy":"My Dream Shop","userImageUrl":"https://img.icons8.com/bubbles/2x/user-male.png","price":1000,"id":4}]
/// errors : null
/// timeGenerated : "2021-02-13T21:55:15.263512Z"
/// isSuccess : true

class BidItemsResponse {
  List<BidItemBody> _body;
  dynamic _errors;
  String _timeGenerated;
  bool _isSuccess;

  List<BidItemBody> get body => _body;
  dynamic get errors => _errors;
  String get timeGenerated => _timeGenerated;
  bool get isSuccess => _isSuccess;

  BidItemsResponse({
      List<BidItemBody> body, 
      dynamic errors, 
      String timeGenerated, 
      bool isSuccess}){
    _body = body;
    _errors = errors;
    _timeGenerated = timeGenerated;
    _isSuccess = isSuccess;
}

  BidItemsResponse.fromJson(dynamic json) {
    if (json["body"] != null) {
      _body = [];
      json["body"].forEach((v) {
        _body.add(BidItemBody.fromJson(v));
      });
    }
    _errors = json["errors"];
    _timeGenerated = json["timeGenerated"];
    _isSuccess = json["isSuccess"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_body != null) {
      map["body"] = _body.map((v) => v.toJson()).toList();
    }
    map["errors"] = _errors;
    map["timeGenerated"] = _timeGenerated;
    map["isSuccess"] = _isSuccess;
    return map;
  }

}

/// createdAt : "2021-02-06T03:27:20.754361+06:00"
/// imageUrl : "2345678.png"
/// description : "item + servicing"
/// createdBy : "Manzur Alahi"
/// userImageUrl : "1234567890.png"
/// price : 650
/// id : 1

class BidItemBody {
  String _createdAt;
  String _imageUrl;
  String _description;
  String _createdBy;
  String _userImageUrl;
  num _price;
  int _id;

  String get createdAt => _createdAt;
  String get imageUrl => _imageUrl;
  String get description => _description;
  String get createdBy => _createdBy;
  String get userImageUrl => _userImageUrl;
  num get price => _price;
  int get id => _id;

  BidItemBody({
      String createdAt, 
      String imageUrl, 
      String description, 
      String createdBy, 
      String userImageUrl, 
      double price,
      int id}){
    _createdAt = createdAt;
    _imageUrl = imageUrl;
    _description = description;
    _createdBy = createdBy;
    _userImageUrl = userImageUrl;
    _price = price;
    _id = id;
}

  BidItemBody.fromJson(dynamic json) {
    _createdAt = json["createdAt"];
    _imageUrl = json["imageUrl"];
    _description = json["description"];
    _createdBy = json["createdBy"];
    _userImageUrl = json["userImageUrl"];
    _price = json["price"];
    _id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["createdAt"] = _createdAt;
    map["imageUrl"] = _imageUrl;
    map["description"] = _description;
    map["createdBy"] = _createdBy;
    map["userImageUrl"] = _userImageUrl;
    map["price"] = _price;
    map["id"] = _id;
    return map;
  }

}