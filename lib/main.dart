import 'package:flutter/material.dart';
import 'package:projeto_base_mobile/home/home_list_page.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
