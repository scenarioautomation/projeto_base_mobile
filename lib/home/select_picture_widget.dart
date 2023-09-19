import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_base_mobile/general/image_picker_controller.dart';

class SelectPictureWidget extends StatefulWidget {
  final String title;
  final void Function(String imagePath) onSelect;

  const SelectPictureWidget(
      {super.key, required this.title, required this.onSelect});

  @override
  State<SelectPictureWidget> createState() => _SelectPictureWidgetState();
}

class _SelectPictureWidgetState extends State<SelectPictureWidget> {
  final ImagePickerController _imagePickerController = ImagePickerController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.image_outlined),
        title: Text(widget.title),
        tileColor: Colors.grey[200],
        onTap: () {
          _selectImage();
        },
      ),
    );
  }

  void _selectImage() async {
    final pickedImagePath = await _imagePickerController.selectImage(
      imageSource: ImageSource.gallery,
      crop: true,
    );
    if (pickedImagePath != null) widget.onSelect(pickedImagePath);
  }
}
