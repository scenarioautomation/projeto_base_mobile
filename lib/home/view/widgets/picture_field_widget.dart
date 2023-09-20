import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_base_mobile/home/view/widgets/select_picture_widget.dart';

class PictureFieldWidget extends StatefulWidget {

  final void Function(String imagePath) onSelect;

  const PictureFieldWidget({super.key, required this.onSelect});

  @override
  State<PictureFieldWidget> createState() => _AddHomePictureFieldState();
}

class _AddHomePictureFieldState extends State<PictureFieldWidget> {
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
