// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sample_screens/utils/helpfulWidgets.dart';

class Select extends StatelessWidget {
  const Select({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: const Text(
            "Demo screens selection",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/verify");
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          //offset: Offset(0, 3),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.verified,
                        color: Colors.white,
                        size: 70,
                      ),
                      addVerticalSpace(15),
                      const Text(
                        "Verification Screen",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              addVerticalSpace(20),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/learn');
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          //offset: Offset(0, 3),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.info,
                        color: Colors.white,
                        size: 70,
                      ),
                      addVerticalSpace(15),
                      const Text(
                        "Learn Screen/\nReport Screen",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
