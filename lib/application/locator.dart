import 'package:flutter_commerce/core/repository/firebase_repo.dart';
import 'package:flutter_commerce/core/service/api.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api('products'));
  locator.registerLazySingleton(() => FirebaseRepository()) ;
}