//data for the items

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_app/order.dart';

List<Widget> cart = [];

List<Widget> items = [
  Item(
    image: "assest/images/s4.jpg",
    name: "NIKE Revolution 7-Black",
    price: '₹2,956',
    des:
        "Product Dimensions  :  34 x 24 x 16 cm; 500 g\nDate First Available  :  18 January 2024\nManufacturer  :  NIKE INDIA PVT LTD\nASIN  :  B0CSPVHN7X\nItem model number  :  FB2207-003\nCountry of Origin  :  Vietnam",
    c: 2956,
  ),
  Item(
    image: "assest/images/shoe1.jpg",
    name: "JQR Shoes for Men",
    price: "₹790",
    des:
        "Product Dimensions  :  30.5 x 20.5 x 10 cm; 700 g\nDate First Available  :  21 October 2023\nManufacturer  :  JQR Sports India Pvt. Ltd.\nASIN  :  B0CLJDQ8B2\nItem model number  :  SIGNATURE\nCountry of Origin  :  India",
    c: 790,
  ),
  Item(
      image: "assest/images/shoe2.jpg",
      name: "Puma Men's Dazzler Sneakers",
      price: "₹1,523",
      des:
          "Product Dimensions  :  25.5 x 19.5 x 10 cm; 600 g\nDate First Available  :  28 January 2022\nManufacturer  :  Puma\nASIN  :  B09RGJCVW6\nItem model number :  39178201\nCountry of Origin  :  India",
      c: 1523),
  Item(
      image: "assest/images/s3.jpg",
      name: "Campus Men's Kosmo PRO Running Shoes",
      price: " ₹799",
      des:
          "Product Dimensions  :  30.5 x 21.5 x 11.2 cm; 900 g\nDate First Available  :  11 December 2020\nManufacturer  :  Campus\nASIN  :  B08QCPDYTG\nItem model number  :  CG-535\nCountry of Origin  :  India",
      c: 799),
  Item(
    image: "assest/images/s5.jpg",
    name: "NIKE Mens Air Max Systm",
    price: "₹6,704",
    des:
        "Product Dimensions  :  30 x 20 x 10 cm; 500 g\nDate First Available  :  8 November 2023\nManufacturer  :  NIKE INDIA PVT. LTD.\nASIN  :  B0CMXX8XDV\nItem model number  :  DM9537-105\nCountry of Origin  :  Vietnam",
    c: 6704,
  )
];

class Item extends StatelessWidget {
  String name, price, image, des;
  int c;
  Item(
      {required this.image,
      required this.name,
      required this.price,
      required this.des,
      required this.c});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              image: image,
              name: name,
              price: price,
              des: des,
              cos: c,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: const Color.fromARGB(255, 59, 59, 59),
          elevation: 10,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  price,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  String image, name, price, des;
  int cos;
  ProductPage(
      {required this.image,
      required this.name,
      required this.price,
      required this.des,
      required this.cos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                }
              },
              icon: const Icon(Icons.exit_to_app_outlined))
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
        child: Column(
          children: [
            Image.asset(image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  " + price,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    const Color.fromARGB(255, 76, 76, 76),
                  ),
                ),
                onPressed: () {
                  cart.add(
                    Item(
                        image: image,
                        name: name,
                        price: price,
                        des: des,
                        c: cos),
                  );
                  cost += cos;
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Center(
                    child: Text(
                      "Add to cart ➤",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Product Details",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                des,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
