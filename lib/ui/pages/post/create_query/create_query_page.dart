import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_loader/screen_loader.dart';
import 'package:snapkart_app/application/data/area_provider.dart';
import 'package:snapkart_app/application/data/category_provider.dart';
import 'package:snapkart_app/core/models/area.dart';
import 'package:snapkart_app/core/models/category.dart';
import 'package:snapkart_app/core/models/city.dart';
import 'package:snapkart_app/ui/pages/post/post_presenter.dart';
import 'package:snapkart_app/ui/widgets/custom_button.dart';
import 'package:snapkart_app/ui/widgets/custom_text_field.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/ui/widgets/my_scroll_view.dart';
import 'package:snapkart_app/ui/widgets/select_image.dart';
import 'package:snapkart_app/utils/styles.dart';
import 'package:toast/toast.dart';

class CreateQueryPage extends StatefulWidget {
  @override
  _CreateQueryPageState createState() => _CreateQueryPageState();
}

class _CreateQueryPageState extends State<CreateQueryPage>
    with ScreenLoader<CreateQueryPage> {
  final _descriptionController = TextEditingController();
  List<City> cities = AreaDataProvider().getCities();
  var _selectedCity = AreaDataProvider().getCities()[0];
  List<Area> areas = AreaDataProvider()
      .getAreas()
      .where((element) => element.cityId == 1)
      .toList();
  var _selectedArea = AreaDataProvider().getAreas()[0];
  var presenter = PostPresenter();
  List<Category> categories = CategoryDataProvider().getCategories();
  Category _selectedCategory = CategoryDataProvider().getCategories().first;
  File _imageFile;

  @override
  Widget screen(BuildContext context) {
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
              child: SelectImageHolder(_onImageSelected)),
          Gaps.vGap8,
          Row(
            children: [
              Gaps.hGap12,
              Text(
                "Select Location",
                style: TextStyles.textStrong14,
              ),
            ],
          ),
          Gaps.vGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Get.width / 2.5,
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
                width: Get.width / 2.5,
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
          Row(
            children: [
              Gaps.hGap12,
              Text(
                "Select Category",
                style: TextStyles.textStrong14,
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
            hintText: "Describe your requirement",
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

  void _onSubmitPressed() async {
    var details = _descriptionController.text;
    if (_selectedCity == null ||
        _selectedArea == null ||
        _selectedCategory == null ||
        _imageFile == null ||
        details.isEmpty) {
      Toast.show("Please fill all required fields.", context);
      return;
    }

    await this.performFuture(() => createPost(details));
  }

  _onImageSelected(File file) {
    _imageFile = file;
  }

  void createPost(String details) async {
    var response = await presenter.createPost(details, _imageFile,
        _selectedCategory.id, _selectedArea.id, _selectedCity.id, [1, 2]);
    if (response.isSuccess) {
      Toast.show("Your post has been submitted!", context);
      Get.back();
    } else {
      Toast.show(response.errorMessage, context);
    }
  }
}
