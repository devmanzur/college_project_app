import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snapkart_app/ui/widgets/upload_image_place_holder.dart';

class SelectImageHolder extends StatefulWidget {
  final Function onImageSelected;

  SelectImageHolder(this.onImageSelected);

  @override
  _SelectImageHolderState createState() => _SelectImageHolderState();
}

class _SelectImageHolderState extends State<SelectImageHolder> {
  File _image;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: _image == null
                ? UploadImagePlaceHolder()
                : Image.file(
                    _image,
                    fit: BoxFit.cover,
                  ),
          ),
          onTap: _imgFromGallery,
        ),
      ),
    );
  }

  Future _imgFromGallery() async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        widget.onImageSelected(_image);
      } else {
        print('No image selected.');
      }
    });
  }
}
