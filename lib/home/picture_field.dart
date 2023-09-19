import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_base_mobile/home/select_picture_widget.dart';

class PictureField extends StatefulWidget {

  final void Function(String imagePath) onSelect;

  const PictureField({super.key, required this.onSelect});

  @override
  State<PictureField> createState() => _AddHomePictureFieldState();
}

class _AddHomePictureFieldState extends State<PictureField> {
  String? currentSelectedPicture;

  @override
  Widget build(BuildContext context) {
    String? picture = currentSelectedPicture;
    String title = picture == null ? "Select picture" : "Change picture";
    return Column(
      children: [
        if (picture != null) Image.file(File(picture)),
        SelectPictureWidget(title: title, onSelect: _onPictureSelect),
      ],
    );
  }

  void _onPictureSelect(String imagePath) {
    setState(() {
      currentSelectedPicture = imagePath;
      widget.onSelect(imagePath);
    });
  }
}
