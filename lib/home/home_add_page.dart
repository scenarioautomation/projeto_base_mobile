import 'package:flutter/material.dart';
import 'package:projeto_base_mobile/general/scenario_colors.dart';
import 'package:projeto_base_mobile/home/model/home_model.dart';
import 'package:projeto_base_mobile/home/picture_field.dart';

class HomeAddPage extends StatefulWidget {

  final void Function(HomeModel home) onAdd;

  const HomeAddPage({super.key, required this.onAdd});

  @override
  State<HomeAddPage> createState() => _HomeAddPageState();
}

class _HomeAddPageState extends State<HomeAddPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController textEditingController = TextEditingController();

  String? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ScenarioColors.accent,
        title: const Text(
          'Add Home',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace_sharp, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          _removeFocus();
        },
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      hintText: "Name",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: ScenarioColors.accent), // Cor de foco
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey), // Cor padrão
                      ),
                    ),
                    cursorColor: ScenarioColors.accent,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  PictureField(
                    onSelect: (String imagePath) {
                      selectedImage = imagePath;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ScenarioColors.accent,
                      ),
                      onPressed: () {
                        _removeFocus();
                        _addHome();
                      },
                      child: const Text(
                        'Create',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addHome() {
    if (_validateFields()) {
      final name = textEditingController.value.text;
      final image = selectedImage;
      if(image == null) return;
      final home = HomeModel(name: name, imagePath: image);
      widget.onAdd(home);
      Navigator.pop(context);
    } else {
      _showErrorAlert();
    }
  }

  void _showErrorAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Please, enter the home name and select its picture."),
        actions: [ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ScenarioColors.accent,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.black),
          ),
        ),],
      ),
    );
  }

  bool _validateFields() {
    return textEditingController.value.text.isNotEmpty && selectedImage != null;
  }

  void _removeFocus() {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
