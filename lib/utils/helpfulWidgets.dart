// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screens/utils/reportPage.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget addHorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

Widget guideBox(String picName) {
  return Container(
    height: 180,
    width: 150,
    decoration: guideStyle(),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: Image(
            height: 90,
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/$picName",
            ),
          ),
        ),
        addVerticalSpace(20),
        Text(
          "Lorem ipsum",
          style: GoogleFonts.roboto(),
        ),
        addVerticalSpace(10),
        Text("John Doe", style: GoogleFonts.roboto(color: Colors.grey))
      ],
    ),
  );
}

class CodeInputField extends StatefulWidget {
  const CodeInputField({super.key});

  @override
  State<CodeInputField> createState() => _CodeInputFieldState();
}

class _CodeInputFieldState extends State<CodeInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CodeInputBox(),
          CodeInputBox(),
          CodeInputBox(),
          CodeInputBox(),
          CodeInputBox(),
          CodeInputBox(),
        ],
      ),
    );
  }
}

class CodeInputBox extends StatefulWidget {
  const CodeInputBox({super.key});

  @override
  State<CodeInputBox> createState() => _CodeInputBoxState();
}

class _CodeInputBoxState extends State<CodeInputBox> {
  Color? color = Colors.grey[200];
  OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(style: BorderStyle.none));
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 56,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
            setState(() {
              color = Colors.green[100];
              border = OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(style: BorderStyle.none));
            });
          } else {
            setState(() {
              //FocusScope.of(context).previousFocus();
              color = Colors.grey[200];
              border =
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10));
            });
          }
        },
        style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          filled: true,
          fillColor: color,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(style: BorderStyle.solid, color: Colors.green),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(style: BorderStyle.none)),
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}

Widget videoBox(String vidThumbnail, String time) {
  return Container(
    //decoration: guideStyle(),
    child: Column(
      children: [
        Container(
          height: 90,
          width: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/$vidThumbnail"), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
        addVerticalSpace(20),
        Text(
          "There are many variations of...",
          style: GoogleFonts.roboto(),
        ),
        addVerticalSpace(5),
        Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Icon(
                  Icons.play_circle_outline_outlined,
                  color: Colors.grey,
                ),
                Text(time, style: GoogleFonts.roboto(color: Colors.grey)),
              ],
            ))
      ],
    ),
  );
}

Widget VideoList() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          videoBox("thumb1.jpg", "15:40"),
          addVerticalSpace(30),
          videoBox("thumb2.jpg", "5:20"),
          addVerticalSpace(30),
          videoBox("thumb3.jpg", "3:13"),
          addVerticalSpace(30),
          videoBox("thumb4.png", "4:01"),
        ],
      ),
      addHorizontalSpace(10),
      Column(
        children: [
          videoBox("thumb5.jpg", "22:43"),
          addVerticalSpace(30),
          videoBox("thumb6.jpg", "5:03"),
          addVerticalSpace(30),
          videoBox("thumb7.jpg", "17:40"),
          addVerticalSpace(30),
          videoBox("thumb8.jpg", "09:21"),
        ],
      )
    ],
  );
}

BoxDecoration guideStyle() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Colors.white,
      border: Border.all(color: Colors.white, width: 5));
}

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //FILTER
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 0, 0),
            child: Text(
              "Filter",
              style:
                  GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ),
          //By type
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 0, 0),
            child: Text(
              "By Type",
              style:
                  GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      value: metal,
                      onChanged: (bool? value) {
                        setState(() {
                          metal = value!;
                        });
                      },
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.green.withOpacity(.32);
                        }
                        return Colors.green;
                      }),
                      shape: CircleBorder(),
                    ),
                  ),
                  Text(
                    "Metal",
                    style: itemStyle(metal),
                  )
                ],
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      value: plastic,
                      onChanged: (bool? value) {
                        setState(() {
                          plastic = value!;
                        });
                      },
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.green.withOpacity(.32);
                        }
                        return Colors.green;
                      }),
                      shape: CircleBorder(),
                    ),
                  ),
                  Text(
                    "Plastic",
                    style: itemStyle(plastic),
                  )
                ],
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      value: organic,
                      onChanged: (bool? value) {
                        setState(() {
                          organic = value!;
                        });
                      },
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.green.withOpacity(.32);
                        }
                        return Colors.green;
                      }),
                      shape: CircleBorder(),
                    ),
                  ),
                  Text(
                    "Organic",
                    style: itemStyle(organic),
                  )
                ],
              ),
            ],
          ),
          //By status
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: Text(
              "By Status",
              style:
                  GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    resolved = !resolved;
                  });
                },
                child: Container(
                  width: 150,
                  height: 75,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: resolved ? Colors.green : Colors.red),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      resolveIcon(resolved),
                      Text(
                        resolved ? "Resolved" : "Unresolved",
                        style: GoogleFonts.roboto(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          //Reports created by
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 0, 0),
            child: Text(
              "Reports Created By",
              style:
                  GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      value: currentUser,
                      onChanged: (bool? value) {
                        setState(() {
                          currentUser = value!;
                        });
                      },
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.green.withOpacity(.32);
                        }
                        return Colors.green;
                      }),
                      shape: CircleBorder(),
                    ),
                  ),
                  Text(
                    "By User",
                    style: itemStyle(currentUser),
                  )
                ],
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      value: otherUsers,
                      onChanged: (bool? value) {
                        setState(() {
                          otherUsers = value!;
                        });
                      },
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.green.withOpacity(.32);
                        }
                        return Colors.green;
                      }),
                      shape: CircleBorder(),
                    ),
                  ),
                  Text(
                    "By Other Users",
                    style: itemStyle(otherUsers),
                  )
                ],
              ),
            ],
          ),
          //Apply filter button
          Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {
                    //TODO Implement Filtering
                  },
                  child: Container(
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                        "Apply",
                        style: TextStyle(color: Colors.white),
                      )))))
        ],
      ),
    );
  }
}

TextStyle itemStyle(bool nesto) {
  return GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: nesto ? Colors.black : Colors.grey);
}

Icon resolveIcon(bool nesto) {
  if (nesto) {
    return Icon(
      Icons.check_outlined,
      color: Colors.green,
    );
  } else {
    return Icon(
      Icons.close_outlined,
      color: Colors.red,
    );
  }
}
