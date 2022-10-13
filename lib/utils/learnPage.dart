// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screens/utils/helpfulWidgets.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          addVerticalSpace(25),
          //LEARN GREEN SOLUTIONS(text)
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Text(
                "LEARN GREEN SOLUTIONS",
                style: GoogleFonts.roboto(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          addVerticalSpace(25),
          //NEW LIFE CREATIVE IDEAS CONTAINER
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 247,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage("assets/learnMore.png"),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NEW LIFE',
                      style: GoogleFonts.roboto(
                          color: Color.fromARGB(255, 154, 117, 8)),
                    ),
                    Text('Creative Ideas',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    SizedBox(
                      width: 160,
                      child: Text(
                          'Discover home made green solutions and ideas to try out',
                          style: GoogleFonts.roboto(color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 154, 117, 8)),
                          ),
                          onPressed: () {},
                          child: Text('VIEW IDEAS')),
                    )
                  ],
                ),
              ),
            ),
          ),
          //WASTE DISPOSAL GUIDE  see all>
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Text(
                    "Waste Disposal Guide",
                    style: GoogleFonts.roboto(fontSize: 20),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "see all",
                        style: GoogleFonts.roboto(fontSize: 16),
                      )),
                ],
              ),
            ),
          ),
          //par containera sa guidovima
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  guideBox("guide1.jpg"),
                  addHorizontalSpace(15),
                  guideBox("guide5.png"),
                  addHorizontalSpace(15),
                  guideBox("guide3.jpg"),
                  addHorizontalSpace(15),
                  guideBox("guide4.jpg"),
                  addHorizontalSpace(15),
                  guideBox("guide1.jpg"),
                  addHorizontalSpace(15),
                ],
              ),
            ),
          ),
          //edukacioni videi
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 0, 0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Educational Videos',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold, fontSize: 20),
                )),
          ),
          addVerticalSpace(15),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'How to tips and tricks for reducing, reusing, recycling waste',
                  style: GoogleFonts.roboto(fontSize: 16, color: Colors.grey),
                )),
          ),
          addVerticalSpace(15),
          //lista videa
          VideoList()
        ],
      ),
    );
  }
}
