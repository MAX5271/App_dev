import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/data.dart';

int cost = 0;

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.abc,
          color: Colors.transparent,
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              }
            },
            icon: const Icon(Icons.exit_to_app_outlined),
          ),
        ],
        centerTitle: true,
        title: Text(
          "Shomp",
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart_checkout_rounded,
                size: 160,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Total products: ${cart.length}.",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Total cost: ₹$cost.",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  cart.clear();
                  Navigator.pop(context);
                },
                child: Card(
                  color: const Color.fromARGB(255, 71, 71, 71),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Center(
                      child: Text(
                        "Continue Shopping ➔",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
