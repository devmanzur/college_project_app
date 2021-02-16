/// body : [{"id":2,"createdBy":"Manzur Alahi","areaId":1,"cityId":1,"description":"I need pet collar","imageUrl":"https://cdn.shopify.com/s/files/1/2292/7923/products/Land_of_Meow_Linny_Cat_Collar_Tan_Brown_with_Gold_Bell_Front_1024x1024.jpg?v=1541743317","categoryId":18,"createdAt":"2021-02-08T01:18:00.27276+06:00","likes":0,"bids":0,"userImageUrl":"https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500","location":null},{"id":1,"createdBy":"Manzur Alahi","areaId":1,"cityId":1,"description":"I need the full body frame for huawei gr5 2017","imageUrl":"https://ae01.alicdn.com/kf/HTB1c.2YQcbpK1RjSZFyq6x_qFXaF.jpg","categoryId":4,"createdAt":"2021-02-06T02:17:29.03691+06:00","likes":2,"bids":2,"userImageUrl":"https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500","location":null}]
/// errors : null
/// timeGenerated : "2021-02-13T17:49:05.1260969Z"
/// isSuccess : true

class TimeLineItemResponse {
  List<PostResponse> _body;
  dynamic _errors;
  String _timeGenerated;
  bool _isSuccess;

  List<PostResponse> get body => _body;
  dynamic get errors => _errors;
  String get timeGenerated => _timeGenerated;
  bool get isSuccess => _isSuccess;

  TimeLineItemResponse({
      List<PostResponse> body, 
      dynamic errors, 
      String timeGenerated, 
      bool isSuccess}){
    _body = body;
    _errors = errors;
    _timeGenerated = timeGenerated;
    _isSuccess = isSuccess;
}

  TimeLineItemResponse.fromJson(dynamic json) {
    if (json["body"] != null) {
      _body = [];
      json["body"].forEach((v) {
        _body.add(PostResponse.fromJson(v));
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

/// id : 2
/// createdBy : "Manzur Alahi"
/// areaId : 1
/// cityId : 1
/// description : "I need pet collar"
/// imageUrl : "https://cdn.shopify.com/s/files/1/2292/7923/products/Land_of_Meow_Linny_Cat_Collar_Tan_Brown_with_Gold_Bell_Front_1024x1024.jpg?v=1541743317"
/// categoryId : 18
/// createdAt : "2021-02-08T01:18:00.27276+06:00"
/// likes : 0
/// bids : 0
/// userImageUrl : "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
/// location : null

class PostResponse {
  int _id;
  String _createdBy;
  int _areaId;
  int _cityId;
  String _description;
  String _imageUrl;
  int _categoryId;
  int _acceptedBidId;
  String _createdAt;
  int _likes;
  int _bids;
  String _userImageUrl;
  dynamic _location;

  int get id => _id;
  String get createdBy => _createdBy;
  int get areaId => _areaId;
  int get cityId => _cityId;
  String get description => _description;
  String get imageUrl => _imageUrl;
  int get categoryId => _categoryId;
  int get acceptedBidId => _acceptedBidId;
  String get createdAt => _createdAt;
  int get likes => _likes;
  int get bids => _bids;
  String get userImageUrl => _userImageUrl;
  dynamic get location => _location;

  PostResponse({
      int id, 
      String createdBy, 
      int areaId, 
      int cityId, 
      String description, 
      String imageUrl, 
      int categoryId, 
      String createdAt, 
      int likes, 
      int bids, 
      String userImageUrl, 
      dynamic location}){
    _id = id;
    _createdBy = createdBy;
    _areaId = areaId;
    _cityId = cityId;
    _description = description;
    _imageUrl = imageUrl;
    _categoryId = categoryId;
    _createdAt = createdAt;
    _likes = likes;
    _bids = bids;
    _userImageUrl = userImageUrl;
    _location = location;
}

  PostResponse.fromJson(dynamic json) {
    _id = json["id"];
    _createdBy = json["createdBy"];
    _areaId = json["areaId"];
    _cityId = json["cityId"];
    _description = json["description"];
    _imageUrl = json["imageUrl"];
    _categoryId = json["categoryId"];
    _acceptedBidId = json["acceptedBidId"];
    _createdAt = json["createdAt"];
    _likes = json["likes"];
    _bids = json["bids"];
    _userImageUrl = json["userImageUrl"];
    _location = json["location"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["createdBy"] = _createdBy;
    map["areaId"] = _areaId;
    map["cityId"] = _cityId;
    map["description"] = _description;
    map["imageUrl"] = _imageUrl;
    map["categoryId"] = _categoryId;
    map["createdAt"] = _createdAt;
    map["likes"] = _likes;
    map["bids"] = _bids;
    map["userImageUrl"] = _userImageUrl;
    map["location"] = _location;
    return map;
  }

}