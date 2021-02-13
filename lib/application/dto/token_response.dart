/// body : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltc","userRole":"customer"}

class TokenResponse {
  Body _body;

  Body get body => _body;

  TokenResponse({
      Body body}){
    _body = body;
}

  TokenResponse.fromJson(dynamic json) {
    _body = json["body"] != null ? Body.fromJson(json["body"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_body != null) {
      map["body"] = _body.toJson();
    }
    return map;
  }

}

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltc"
/// userRole : "customer"

class Body {
  String _token;
  String _userRole;

  String get token => _token;
  String get userRole => _userRole;

  Body({
      String token, 
      String userRole}){
    _token = token;
    _userRole = userRole;
}

  Body.fromJson(dynamic json) {
    _token = json["token"];
    _userRole = json["userRole"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["token"] = _token;
    map["userRole"] = _userRole;
    return map;
  }

}