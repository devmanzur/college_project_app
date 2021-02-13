class CoreDataProvider {
  static final CoreDataProvider _singleton = CoreDataProvider._internal();

  factory CoreDataProvider() => _singleton;

  CoreDataProvider._internal();

  String _baseUrl;

  setBaseUrl(String url) {
    _baseUrl = url;
  }

  String getBaseUrl() {
    return (_baseUrl??"")+"api/v1/";
  }
}
