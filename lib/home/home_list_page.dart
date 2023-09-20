import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:projeto_base_mobile/general/scenario_colors.dart';
import 'package:projeto_base_mobile/home/home_add_page.dart';
import 'package:projeto_base_mobile/home/home_controller.dart';
import 'package:projeto_base_mobile/home/home_list_item.dart';

class HomeListPage extends StatefulWidget {
  const HomeListPage({super.key});

  @override
  State<HomeListPage> createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage> with AfterLayoutMixin {
  final controller = HomeController();

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await controller.initHomes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ScenarioColors.accent,
        title: const Text(
          'Homes',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeAddPage(
                    onAdd: (home) async {
                      controller.addHome(home).whenComplete(() {
                        setState(() {});
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var pressedRemove = false;
          var home = controller.homes[index];
          return Dismissible(
            key: ValueKey(home),
            dismissThresholds: const {DismissDirection.endToStart: 0.9},
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.delete_rounded, color: Colors.black),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Remove',
                        style: TextStyle(
                            color: Color(0xFF8D0F05),
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    Text(home.name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            confirmDismiss: (direction) async {
              await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("The home ${home.name} will be removed"),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8D0F05),
                          ),
                          onPressed: () async {
                            pressedRemove = true;
                            controller.removeHome(home).whenComplete(() {
                              Navigator.pop(context);
                            });
                          },
                          child: const Text(
                            'Remove',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  });
              return pressedRemove;
            },
            child: HomeListItem(
              home: home,
            ),
          );
        },
        itemCount: controller.homes.length,
      ),
    );
  }
}
