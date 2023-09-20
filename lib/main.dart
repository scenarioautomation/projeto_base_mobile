import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:projeto_base_mobile/home/view/home_list_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      startLocale: const Locale('pt', 'BR'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      fallbackLocale: const Locale('pt', 'BR'),
      path: "res/translations",
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomeListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
