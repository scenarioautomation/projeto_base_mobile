import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:projeto_base_mobile/general/scenario_colors.dart';
import 'package:projeto_base_mobile/home/model/home_model.dart';
import 'package:projeto_base_mobile/home/view/widgets/picture_field_widget.dart';

class HomeAddPage extends StatefulWidget {

  final Future<void> Function(HomeModel home) onAdd;

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
          'add.addHome',
          style: TextStyle(color: ScenarioColors.dark),
        ).tr(),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace_sharp, color: ScenarioColors.dark),
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
                    decoration:  InputDecoration(
                      hintText: "add.name".tr(),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: ScenarioColors.accent),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ScenarioColors.grey),
                      ),
                    ),
                    cursorColor: ScenarioColors.accent,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  PictureFieldWidget(
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
                        'add.create',
                        style: TextStyle(color: ScenarioColors.dark),
                      ).tr(),
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

  Future<void> _addHome() async {
    if (_validateFields()) {
      final name = textEditingController.value.text;
      final image = selectedImage;
      if(image == null) return;
      final home = HomeModel(name: name, imagePath: image);
      widget.onAdd(home).whenComplete(() {
        Navigator.pop(context);
      });
    } else {
      _showErrorAlert();
    }
  }

  void _showErrorAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("add.fields_alert").tr(),
        actions: [ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ScenarioColors.accent,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'add.ok',
            style: TextStyle(color: ScenarioColors.dark),
          ).tr(),
        ),],
      ),
    );
  }

  bool _validateFields() {
    return textEditingController.value.text.trim().isNotEmpty && selectedImage != null;
  }

  void _removeFocus() {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
