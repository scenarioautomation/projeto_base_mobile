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
        itemBuilder: (context, index) => HomeListItem(home: homes[index]),
        itemCount: homes.length,
      ),
    );
  }
}
