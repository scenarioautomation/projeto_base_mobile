import 'package:flutter/material.dart';
import 'package:projeto_base_mobile/home/model/home_model.dart';

class HomeListItem extends StatefulWidget {
  final HomeModel home;

  const HomeListItem({super.key, required this.home});

  @override
  State<HomeListItem> createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.home),
      title: Text(widget.home.name),
      trailing: const Icon(Icons.navigate_next_sharp),
    );
  }
}
