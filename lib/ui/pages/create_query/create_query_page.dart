import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapkart_app/core/data/area_provider.dart';
import 'package:snapkart_app/core/data/category_provider.dart';
import 'package:snapkart_app/core/models/area.dart';
import 'package:snapkart_app/core/models/category.dart';
import 'package:snapkart_app/core/models/city.dart';
import 'package:snapkart_app/ui/widgets/custom_button.dart';
import 'package:snapkart_app/ui/widgets/custom_text_field.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/ui/widgets/my_scroll_view.dart';
import 'package:snapkart_app/ui/widgets/select_image.dart';
import 'package:snapkart_app/utils/styles.dart';

class CreateQueryPage extends StatefulWidget {
  @override
  _CreateQueryPageState createState() => _CreateQueryPageState();
}

class _CreateQueryPageState extends State<CreateQueryPage> {
  final _descriptionController = TextEditingController();
  List<City> cities = AreaDataProvider().getCities();
  var _selectedCity = AreaDataProvider().getCities()[0];
  List<Area> areas = AreaDataProvider()
      .getAreas()
      .where((element) => element.cityId == 1)
      .toList();
  var _selectedArea = AreaDataProvider().getAreas()[0];

  List<Category> categories = CategoryDataProvider().getCategories();
  Category _selectedCategory = CategoryDataProvider().getCategories().first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post Query",
          style: TextStyles.textBold18White,
        ),
        centerTitle: true,
      ),
      body: MyScrollView(
        padding: EdgeInsets.all(12),
        children: [
          Container(
              color: Colors.black,
              margin: EdgeInsets.all(16),
              height: Get.width / 2,
              width: Get.width,
              child: SelectImageHolder()),
          Gaps.vGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Get.width/2.5,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      isExpanded: true,
                      items: buildCityDropDownItems(),
                      value: _selectedCity,
                      onChanged: (value) {
                        setState(() {
                          _updateArea(value);
                        });
                      }),
                ),
              ),
              Gaps.hGap16,
              Container(
                width: Get.width/2.5,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      isExpanded: true,
                      items: buildAreaDropDownItems(),
                      value: _selectedArea,
                      onChanged: (value) {
                        setState(() {
                          _selectedArea = value;
                        });
                      }),
                ),
              ),
            ],
          ),
          Gaps.vGap8,
          DropdownButtonHideUnderline(
            child: DropdownButton(
                isExpanded: true,
                items: buildCategoryDropDownItems(),
                value: _selectedCategory,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                }),
          ),
          Gaps.vGap12,
          CustomTextField(
            controller: _descriptionController,
            hintText: "Describe your offer",
          ),
          Gaps.vGap16,
          CustomButton(
            text: "Submit",
            onPressed: _onSubmitPressed,
          )
        ],
      ),
    );
  }

  void _updateArea(value) {
    _selectedCity = value;
    areas = AreaDataProvider()
        .getAreas()
        .where((element) => element.cityId == _selectedCity.id)
        .toList();
    _selectedArea = areas[0];
  }

  List<DropdownMenuItem<Area>> buildAreaDropDownItems() {
    List<DropdownMenuItem<Area>> items = List();
    for (Area area in areas) {
      items.add(
        DropdownMenuItem(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              area.name,
              style: TextStyles.text,
            ),
          ),
          value: area,
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<City>> buildCityDropDownItems() {
    List<DropdownMenuItem<City>> items = List();
    for (City city in cities) {
      items.add(
        DropdownMenuItem(
          value: city,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              city.name,
              style: TextStyles.text,
            ),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<Category>> buildCategoryDropDownItems() {
    List<DropdownMenuItem<Category>> items = List();
    for (Category category in categories) {
      items.add(
        DropdownMenuItem(
          value: category,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              category.name,
              style: TextStyles.text,
            ),
          ),
        ),
      );
    }
    return items;
  }


  void _onSubmitPressed() {}
}
