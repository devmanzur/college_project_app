import 'package:get_it/get_it.dart';
import 'package:snapkart_app/application/brokers/api_broker.dart';
import 'package:snapkart_app/application/services/core_data_service.dart';
import 'package:snapkart_app/application/services/image_storage_service.dart';
import 'package:snapkart_app/ui/pages/login/login_presenter.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(CoreDataService());
  locator.registerLazySingleton(() => ImageStorageService());
  locator.registerLazySingleton(() => ApiBroker());
  locator.registerFactory<LoginPresenter>(() => LoginPresenter());
}
