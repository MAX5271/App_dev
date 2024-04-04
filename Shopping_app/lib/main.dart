import 'package:flutter/material.dart';
import 'package:shopping_app/frontPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FrontPage(),
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
    );
  }
}
