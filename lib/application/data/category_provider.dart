import 'package:snapkart_app/core/models/category.dart';

class CategoryDataProvider {

  static final CategoryDataProvider _singleton = CategoryDataProvider._internal();

  factory CategoryDataProvider() => _singleton;

  CategoryDataProvider._internal();

  List<Category> getCategories() {
    return [
      Category(1, "Utilities"),
      Category(2, "Mobile Phone"),
      Category(3, "Mobile Phone Accessories"),
      Category(4, "Mobile Phone Servicing"),
      Category(5, "Computers"),
      Category(6, "Laptops"),
      Category(7, "Computer Accessories"),
      Category(8, "Camera"),
      Category(9, "Camera Accessories"),
      Category(10, "Men's Fashion"),
      Category(11, "Men's Foot ware"),
      Category(12, "Women's Fashion"),
      Category(13, "Women's Foot ware"),
      Category(14, "Kids Fashion"),
      Category(15, "Kids Foot ware"),
      Category(16, "Beauty & Wellness"),
      Category(17, "Electronics"),
      Category(18, "Pet Shop"),
    ];
  }
}
