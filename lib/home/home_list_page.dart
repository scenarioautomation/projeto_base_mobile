import 'package:flutter/material.dart';
import 'package:projeto_base_mobile/general/scenario_colors.dart';
import 'package:projeto_base_mobile/home/home_add_page.dart';
import 'package:projeto_base_mobile/home/home_list_item.dart';
import 'package:projeto_base_mobile/home/model/home_model.dart';

class HomeListPage extends StatefulWidget {
  const HomeListPage({super.key});

  @override
  State<HomeListPage> createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage> {
  final List<HomeModel> homes = [];

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
                    onAdd: (home) {
                      setState(() {
                        homes.add(home);
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
          return Dismissible(
            key: GlobalKey(),
            confirmDismiss: (direction) async {
              await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title:
                          Text("The home ${homes[index].name} will be removed"),
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
                            backgroundColor: ScenarioColors.accent,
                          ),
                          onPressed: () {
                            pressedRemove = true;
                            _removeHome(index);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Remove',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    );
                  });
              return pressedRemove;
            },
            child: HomeListItem(
              home: homes[index],
            ),
          );
        },
        itemCount: homes.length,
      ),
    );
  }

  void _removeHome(int index) {
    setState(() {
      homes.removeAt(index);
    });
  }
}
