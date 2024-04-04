import 'dart:io';
import 'dart:ui';
import 'package:dart_eval/dart_eval.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String cal = "";
  String calculate = "";
  String past = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                }
              },
              icon: const Icon(Icons.exit_to_app_outlined))
        ],
        backgroundColor: const Color.fromARGB(255, 5, 24, 51),
        title: const Text(
          "Calculator",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 4, 11, 25),
                    Color.fromARGB(255, 2, 15, 30),
                    Color.fromARGB(255, 6, 30, 50),
                    Color.fromARGB(255, 9, 40, 65),
                  ],
                ),
              ),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "$past\n$cal",
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 1,
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.white,
                Colors.grey,
                Color.fromARGB(255, 4, 11, 25),
              ])),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 4, 11, 25),
                  Color.fromARGB(255, 2, 15, 30),
                  Color.fromARGB(255, 6, 30, 50),
                  Color.fromARGB(255, 9, 40, 65),
                ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onLongPress: () {
                              setState(() {
                                past = "";
                                cal = "";
                                calculate = "";
                              });
                            },
                            onPressed: () {
                              setState(() {
                                cal = cal.substring(0, cal.length - 1);
                                calculate = calculate.substring(
                                    0, calculate.length - 1);
                              });
                            },
                            child: Icon(
                              Icons.backspace_rounded,
                              size: 35,
                              color: Color.fromARGB(255, 174, 117, 117),
                            )),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              cal = cal + "(";
                              calculate = calculate + "(";
                            });
                          },
                          child: const Text(
                            "(",
                            style: TextStyle(
                                fontSize: 35,
                                color: Color.fromARGB(255, 98, 134, 163),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              cal = cal + ")";
                              calculate = calculate + ")";
                            });
                          },
                          child: const Text(
                            ")",
                            style: TextStyle(
                                fontSize: 35,
                                color: Color.fromARGB(255, 98, 134, 163),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (int.parse(cal[cal.length - 1]) >= 0 &&
                                int.parse(cal[cal.length - 1]) <= 9)
                              setState(() {
                                cal = cal + "÷";
                                calculate = calculate + "/";
                              });
                          },
                          child: const Text(
                            "÷",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              cal = cal + '1';
                              calculate = calculate + "1";
                            });
                          },
                          child: const Text(
                            "1",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              cal = cal + "2";
                              calculate = calculate + "2";
                            });
                          },
                          child: const Text(
                            "2",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              cal = cal + "3";
                              calculate = calculate + "3";
                            });
                          },
                          child: const Text(
                            "3",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (int.parse(cal[cal.length - 1]) >= 0 &&
                                int.parse(cal[cal.length - 1]) <= 9)
                              setState(() {
                                cal = cal + "x";
                                calculate = calculate + "*";
                              });
                          },
                          child: const Text(
                            "x",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              cal = cal + "4";
                              calculate = calculate + "4";
                            });
                          },
                          child: const Text(
                            "4",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              cal = cal + "5";
                              calculate = calculate + "5";
                            });
                          },
                          child: const Text(
                            "5",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              cal = cal + "6";
                              calculate = calculate + "6";
                            });
                          },
                          child: const Text(
                            "6",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (int.parse(cal[cal.length - 1]) >= 0 &&
                                int.parse(cal[cal.length - 1]) <= 9)
                              setState(() {
                                cal = cal + "+";
                                calculate = calculate + "+";
                              });
                          },
                          child: const Text(
                            "+",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              cal = cal + "7";
                              calculate = calculate + "7";
                            });
                          },
                          child: const Text(
                            "7",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              cal = cal + "8";
                              calculate = calculate + "8";
                            });
                          },
                          child: const Text(
                            "8",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              cal = cal + "9";
                              calculate = calculate + "9";
                            });
                          },
                          child: const Text(
                            "9",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (int.parse(cal[cal.length - 1]) >= 0 &&
                                int.parse(cal[cal.length - 1]) <= 9) {
                              setState(() {
                                cal = cal + "-";
                                calculate = calculate + "-";
                              });
                            } else
                              setState(() {
                                cal = cal + "l";
                              });
                          },
                          child: const Text(
                            "-",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            if (int.parse(cal[cal.length - 1]) >= 0 &&
                                int.parse(cal[cal.length - 1]) <= 9)
                              setState(() {
                                cal = cal + ".";
                                calculate = calculate + '.';
                              });
                          },
                          child: const Text(
                            ".",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              cal = cal + "0";
                              calculate = calculate + '0';
                            });
                          },
                          child: const Text(
                            "0",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              cal = cal + "00";
                              calculate = calculate + "00";
                            });
                          },
                          child: const Text(
                            "00",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 69, 101, 206),
                              ),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                          onPressed: () {
                            setState(() {
                              past = cal;
                              cal = eval(calculate).toString();
                              calculate = cal;
                            });
                          },
                          child: Text(
                            "=",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
