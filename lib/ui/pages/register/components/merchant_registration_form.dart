import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:snapkart_app/application/data/area_provider.dart';
import 'package:snapkart_app/application/data/category_provider.dart';
import 'package:snapkart_app/core/models/area.dart';
import 'package:snapkart_app/core/models/category.dart';
import 'package:snapkart_app/core/models/city.dart';
import 'package:snapkart_app/ui/widgets/custom_button.dart';
import 'package:snapkart_app/ui/widgets/custom_button_alternate.dart';
import 'package:snapkart_app/ui/widgets/custom_text_field.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';
import 'package:snapkart_app/ui/widgets/my_scroll_view.dart';
import 'package:snapkart_app/utils/styles.dart';
import 'package:snapkart_app/utils/utils.dart';

class MerchantRegistrationForm extends StatefulWidget {
  final Function onRegisterSubmit;

  MerchantRegistrationForm(this.onRegisterSubmit);

  @override
  _MerchantRegistrationFormState createState() =>
      _MerchantRegistrationFormState();
}

class _MerchantRegistrationFormState extends State<MerchantRegistrationForm> {
  final FocusNode _nodeText1 = FocusNode();

  final FocusNode _nodeText2 = FocusNode();

  final FocusNode _nodeText3 = FocusNode();

  final FocusNode _nodeText4 = FocusNode();

  final FocusNode _nodeText5 = FocusNode();

  final _nameController = TextEditingController();

  final _phoneController = TextEditingController();

  final _addressController = TextEditingController();

  final _passwordController = TextEditingController();

  final _passwordConfirmController = TextEditingController();

  List<City> cities = AreaDataProvider().getCities();
  var _selectedCity = AreaDataProvider().getCities()[0];

  List<Area> areas = AreaDataProvider()
      .getAreas()
      .where((element) => element.cityId == 1)
      .toList();
  var _selectedArea = AreaDataProvider().getAreas()[0];
  List<Category> _selectedCategories = List<Category>();

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

  @override
  Widget build(BuildContext context) {
    return MyScrollView(
      keyboardConfig: Utils.getKeyboardActionsConfig(context, <FocusNode>[
        _nodeText1,
        _nodeText2,
        _nodeText3,
        _nodeText4,
        _nodeText5
      ]),
      children: [
        Text(
          "Select City",
          style: TextStyles.textBold12,
        ),
        Gaps.vGap8,
        DropdownButtonHideUnderline(
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
        Gaps.vGap8,
        Text(
          "Select Area",
          style: TextStyles.textBold12,
        ),
        Gaps.vGap8,
        DropdownButtonHideUnderline(
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
        Gaps.vGap12,
        MultiSelectDialogField(
          buttonText: Text("Select Categories"),
          buttonIcon: Icon(Icons.arrow_drop_down),
          chipDisplay: MultiSelectChipDisplay<Category>.none(),
          initialValue: _selectedCategories,
          title: Text("Categories"),
          items: CategoryDataProvider()
              .getCategories()
              .map((e) => MultiSelectItem(e, e.name))
              .toList(),
          listType: MultiSelectListType.CHIP,
          searchable: true,
          onConfirm: _onCategoriesSelected,
        ),
        Gaps.vGap12,
        CustomTextField(
          focusNode: _nodeText1,
          controller: _nameController,
          maxLength: 50,
          keyboardType: TextInputType.text,
          hintText: "Shop Name",
        ),
        Gaps.vGap12,
        CustomTextField(
          focusNode: _nodeText2,
          controller: _phoneController,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          hintText: "Phone number",
        ),
        Gaps.vGap12,
        CustomTextField(
          focusNode: _nodeText3,
          controller: _addressController,
          maxLength: 100,
          keyboardType: TextInputType.streetAddress,
          hintText: "Address",
        ),
        Gaps.vGap12,
        CustomTextField(
          focusNode: _nodeText4,
          isInputPwd: true,
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          maxLength: 16,
          hintText: "Password",
        ),
        Gaps.vGap12,
        CustomTextField(
          focusNode: _nodeText5,
          isInputPwd: true,
          controller: _passwordConfirmController,
          keyboardType: TextInputType.visiblePassword,
          maxLength: 16,
          hintText: "Confirm Password",
        ),
        Gaps.vGap12,
        CustomButton(
          key: const Key('register'),
          onPressed: () {
            widget.onRegisterSubmit(
                _nameController.text,
                _phoneController.text,
                _addressController.text,
                _passwordController.text,
                _passwordConfirmController.text,
                _selectedCity,
                _selectedArea,
                _selectedCategories);
          },
          text: "Register",
        ),
        Gaps.vGap12,
      ],
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

  void _onCategoriesSelected(List<Category> categories) {
    _selectedCategories = categories;
  }
}
