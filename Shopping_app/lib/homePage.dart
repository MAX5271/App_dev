import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/cart.dart';
import 'package:shopping_app/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart(),
                ),
              );
            },
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                }
              },
              icon: const Icon(Icons.exit_to_app_outlined),
              color: Colors.white,
            )
          ],
          centerTitle: true,
          title: Text(
            "Shomp",
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: PopScope(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: items,
            ),
          ),
          onPopInvoked: (didPop) {
            SystemNavigator.pop();
          },
        ));
  }
}
