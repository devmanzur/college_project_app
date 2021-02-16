import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapkart_app/application/data/category_provider.dart';
import 'package:snapkart_app/ui/pages/home/time_line_page.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/utils/styles.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  var categories = CategoryDataProvider().getCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(TimeLinePage(categoryId: categories[index].id),
                  fullscreenDialog: true);
            },
            child: Card(
              elevation: 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(categories[index].imageUrl),
                  Gaps.vGap8,
                  Text(
                    categories[index].name,
                    style: TextStyles.textSize12,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
