import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:projeto_base_mobile/general/scenario_colors.dart';
import 'package:projeto_base_mobile/home/view/home_add_page.dart';
import 'package:projeto_base_mobile/home/viewmodel/home_view_model.dart';
import 'package:projeto_base_mobile/home/view/home_list_item.dart';

class HomeListPage extends StatefulWidget {
  const HomeListPage({super.key});

  @override
  State<HomeListPage> createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage> with AfterLayoutMixin {
  final store = HomeViewModel();

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    store.initHomes().whenComplete(() {
        setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ScenarioColors.accent,
        title: const Text(
          "homes",
          style: TextStyle(color: ScenarioColors.dark),
        ).tr(),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: ScenarioColors.dark),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeAddPage(
                    onAdd: (home) async {
                      store.addHome(home).whenComplete(() {
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
          var home = store.homes[index];
          return Dismissible(
            key: ValueKey(home),
            dismissThresholds: const {DismissDirection.endToStart: 0.9},
            direction: DismissDirection.endToStart,
            background: Container(
              color: ScenarioColors.grey,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.delete_rounded, color: ScenarioColors.dark),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('remove',
                        style: TextStyle(
                            color: ScenarioColors.delete,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)).tr(),
                    Text(home.name,
                        style: const TextStyle(
                            color: ScenarioColors.dark,
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
                      title: const Text("homeWillBeRemoved").tr(args: [home.name]),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ScenarioColors.dark,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'cancel',
                            style: TextStyle(color: ScenarioColors.secondary),
                          ).tr(),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ScenarioColors.delete,
                          ),
                          onPressed: () async {
                            pressedRemove = true;
                            store.removeHome(home).whenComplete(() {
                              Navigator.pop(context);
                            });
                          },
                          child: const Text(
                            'remove',
                            style: TextStyle(color: ScenarioColors.secondary),
                          ).tr(),
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
        itemCount: store.homes.length,
      ),
    );
  }
}
