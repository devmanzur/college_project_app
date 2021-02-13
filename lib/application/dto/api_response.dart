class ApiResponse {
  dynamic _body;
  List<Errors> _errors;
  String _timeGenerated;

  dynamic get body => _body;
  List<Errors> get errors => _errors;
  String get timeGenerated => _timeGenerated;

  ApiResponse({
      dynamic body, 
      List<Errors> errors, 
      String timeGenerated}){
    _body = body;
    _errors = errors;
    _timeGenerated = timeGenerated;
}

  ApiResponse.fromJson(dynamic json) {
    _body = json["body"];
    if (json["errors"] != null) {
      _errors = [];
      json["errors"].forEach((v) {
        _errors.add(Errors.fromJson(v));
      });
    }
    _timeGenerated = json["timeGenerated"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["body"] = _body;
    if (_errors != null) {
      map["errors"] = _errors.map((v) => v.toJson()).toList();
    }
    map["timeGenerated"] = _timeGenerated;
    return map;
  }

}

/// propertyName : "action"
/// errorMessage : "invalid user/password combination"

class Errors {
  String _propertyName;
  String _errorMessage;

  String get propertyName => _propertyName;
  String get errorMessage => _errorMessage;

  Errors({
      String propertyName, 
      String errorMessage}){
    _propertyName = propertyName;
    _errorMessage = errorMessage;
}

  Errors.fromJson(dynamic json) {
    _propertyName = json["propertyName"];
    _errorMessage = json["errorMessage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["propertyName"] = _propertyName;
    map["errorMessage"] = _errorMessage;
    return map;
  }

}