import 'package:snapkart_app/core/models/area.dart';
import 'package:snapkart_app/core/models/city.dart';

class AreaDataProvider {
  static final AreaDataProvider _singleton = AreaDataProvider._internal();

  factory AreaDataProvider() => _singleton;

  AreaDataProvider._internal();

  List<City> getCities() {
    return [
      City(1, "Dhaka"),
      City(2, "Chittagong"),
    ];
  }

  List<Area> getAreas() {
    return [
      Area(1, 6, "All of Dhaka"),
      Area(1, 1, "Dhanmondi"),
      Area(1, 2, "Mirpur"),
      Area(1, 3, "Uttara"),
      Area(1, 4, "Muhammadpur"),
      Area(1, 5, "Savar"),
      Area(2, 7, "All of Chittagong"),
      Area(2, 8, "Agrabad"),
      Area(2, 9, "Kotowali"),
      Area(2, 10, "Chawk Bazar"),
      Area(2, 11, "Nasirabad"),
      Area(2, 12, "Hali Sahar"),
    ];
  }
}
