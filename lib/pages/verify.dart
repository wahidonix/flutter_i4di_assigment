// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screens/utils/helpfulWidgets.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/verify1.png"), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: CupertinoNavigationBarBackButton(
                color: Colors.black,
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text(
                "Verify number",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: false,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40)),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Verification
                      Text(
                        "Verification",
                        style: GoogleFonts.openSans(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      //Please type the code
                      Text(
                        "Enter the code sent to +381 061 1111 111",
                        style: GoogleFonts.openSans(
                            fontSize: 15, color: Colors.grey),
                      ),
                      // number fields
                      CodeInputField(),
                      //Didn't recieve a code
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't recieve a code?",
                            style: GoogleFonts.openSans(fontSize: 16),
                          ),
                          TextButton(
                              focusNode: FocusNode(skipTraversal: true),
                              onPressed: () {},
                              child: Text(
                                "REQUEST AGAIN",
                                style: GoogleFonts.openSans(
                                    color: Colors.green, fontSize: 15),
                              ))
                        ],
                      ),
                      //Verify button
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextButton(
                          onPressed: () {
                            const snackBar = SnackBar(
                              content: Text('Verification snackbar'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: Text(
                            "Verify",
                            style: GoogleFonts.openSans(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      //change phone numbah
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Change phone number",
                            style: GoogleFonts.openSans(fontSize: 14),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_right_alt,
                              color: Colors.green,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
