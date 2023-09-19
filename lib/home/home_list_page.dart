import 'package:flutter/material.dart';
import 'package:projeto_base_mobile/home/home_add_page.dart';
import 'package:projeto_base_mobile/home/home_list_item.dart';

class HomeListPage extends StatefulWidget {
  const HomeListPage({super.key});

  @override
  State<HomeListPage> createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Homes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomeAddPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => HomeListItem(index: index),
        itemCount: 5,
      ),
    );
  }
}
