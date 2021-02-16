import 'package:snapkart_app/core/models/category.dart';

class CategoryDataProvider {
  static final CategoryDataProvider _singleton =
      CategoryDataProvider._internal();

  factory CategoryDataProvider() => _singleton;

  CategoryDataProvider._internal();

  List<Category> getCategories() {
    return [
      Category(
          1, "Utilities", "https://img.icons8.com/nolan/64/settings--v1.png"),
      Category(2, "Mobile Phone",
          "https://img.icons8.com/nolan/64/two-smartphones.png"),
      Category(3, "Mobile Phone Accessories",
          "https://img.icons8.com/nolan/64/earbud-headphones.png"),
      Category(4, "Mobile Phone Servicing",
          "https://img.icons8.com/nolan/64/medical-mobile-app-2.png"),
      Category(5, "Computers", "https://img.icons8.com/nolan/64/computer.png"),
      Category(6, "Laptops", "https://img.icons8.com/nolan/64/laptop.png"),
      Category(7, "Computer Accessories",
          "https://img.icons8.com/nolan/64/c-drive-2.png"),
      Category(
          8, "Camera", "https://img.icons8.com/nolan/64/google-images.png"),
      Category(9, "Camera Accessories",
          "https://img.icons8.com/nolan/64/camera-flash.png"),
      Category(
          10, "Men's Fashion", "https://img.icons8.com/nolan/64/clothes.png"),
      Category(11, "Men's Foot ware",
          "https://img.icons8.com/nolan/64/trainers.png"),
      Category(
          12, "Women's Fashion", "https://img.icons8.com/nolan/64/skirt.png"),
      Category(13, "Women's Foot ware",
          "https://img.icons8.com/nolan/64/flip-flops.png"),
      Category(
          14, "Kids Fashion", "https://img.icons8.com/nolan/64/clothes.png"),
      Category(
          15, "Kids Foot ware", "https://img.icons8.com/nolan/64/trainers.png"),
      Category(16, "Beauty & Wellness",
          "https://img.icons8.com/nolan/64/makeup-bag.png"),
      Category(
          17, "Electronics", "https://img.icons8.com/nolan/64/processor.png"),
      Category(18, "Pet Shop", "https://img.icons8.com/nolan/64/cat.png"),
    ];
  }
}
