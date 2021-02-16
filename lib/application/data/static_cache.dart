import 'package:snapkart_app/application/dto/time_line_item.dart';

class StaticCache {
  static final StaticCache _singleton = StaticCache._internal();

  List<PostResponse> _posts = List<PostResponse>();

  int _selectedCategory = 0;

  factory StaticCache() => _singleton;

  StaticCache._internal();

  List<PostResponse> get posts => _posts;

  int get selectedCategory => _selectedCategory;

  void setPosts(List<PostResponse> items, int category) {
    _posts = items;
    _selectedCategory = category;
  }

  clear(){
    _posts.clear();
    _selectedCategory = 0;
  }
}
