import 'package:snapkart_app/application/brokers/firebase_data_broker.dart';

class CoreDataService{

  var firebaseRepo = FirebaseDataBroker("core_data");

  String _baseUrl = "";

  Future<String> getBaseUrl() async{
    if(_baseUrl.isEmpty){
      var data = await firebaseRepo.getDocumentById("0DqLEFit1KR32i657crT");
      _baseUrl = data.data()["base_url"];
    }
    return _baseUrl;
  }

}