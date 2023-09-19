import 'package:flutter/material.dart';

class HomeListItem extends StatefulWidget {
  final int index;

  const HomeListItem({super.key, required this.index});

  @override
  State<HomeListItem> createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  @override
  Widget build(BuildContext context) {
    var index = widget.index;
    return ListTile(
      leading: const Icon(Icons.home),
      tileColor: _getTileColor(index),
      title: Text('Home ${index + 1}'),
      trailing: const Icon(Icons.navigate_next_sharp),
    );
  }

  Color? _getTileColor(int index) {
    return index % 2 == 0 ? Colors.white : Colors.grey[50];
  }
}
