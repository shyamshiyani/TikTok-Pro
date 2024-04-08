import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class alaram_clock extends StatefulWidget {
  const alaram_clock({super.key});

  @override
  State<alaram_clock> createState() => _alaram_clockState();
}

class _alaram_clockState extends State<alaram_clock> {
  DateTime time = DateTime.now();
  double sec = (3 * pi) / 2;
  int secDigital = 0;
  double min = (3 * pi) / 2;
  int minDigital = 0;
  double hour = (3 * pi) / 2;
  int hourDigital = 0;
  bool switchCheak1 = false;
  bool switchCheak2 = false;
  bool switchCheak3 = false;
  bool switchCheak4 = false;
  bool switchCheak5 = false;
  bool switchCheak6 = false;
  bool switchCheak7 = false;
  @override
  void initState() {
    super.initState();

    setState(() {
      minDigital = time.minute;
      secDigital = time.second;
      hourDigital = time.hour;

      sec = sec + secDigital * (pi / 30);
      min = min + minDigital * (pi / 30);
      hour = hour + hourDigital * (pi / 6);
    });

    timer();
  }

  void timer() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (secDigital >= 59) {
          sec = (3 * pi) / 2;
          secDigital = 0;
          minDigital++;
          min = min + (pi / 30);
        } else if (minDigital >= 59) {
          min = (3 * pi) / 2;
          minDigital = 0;
          hour = hour + (pi / 6);
          hourDigital++;
        } else {
          secDigital++;
          sec = sec + (pi / 30);
        }
      });
      timer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.of(context).pop('home_page');
            });
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        color: const Color(0xff1A1A1A),
        title: NeumorphicText(
          "Alarm Watch",
          style: const NeumorphicStyle(
            color: Colors.white,
            depth: 1,
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color(0xff666666),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Neumorphic(
                            style: const NeumorphicStyle(
                              depth: 5,
                              border: NeumorphicBorder(
                                  width: 2, color: Colors.blueGrey),
                              boxShape: NeumorphicBoxShape.circle(),
                            ),
                            child: SizedBox(
                              height: 362,
                              width: 362,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    value: hourDigital * (1 / 12),
                                    color: Color(0xffF3BCC8),
                                    strokeWidth: 12,
                                    strokeAlign: 15,
                                    strokeCap: StrokeCap.round,
                                  ),
                                  CircularProgressIndicator(
                                    value: minDigital * (1 / 60),
                                    color: Color(0xffE893CF),
                                    strokeWidth: 12,
                                    strokeAlign: 20,
                                    strokeCap: StrokeCap.round,
                                  ),
                                  CircularProgressIndicator(
                                    value: secDigital * (1 / 60),
                                    color: Color(0xffB799FF),
                                    strokeWidth: 12,
                                    strokeAlign: 24,
                                    strokeCap: StrokeCap.round,
                                  ),
                                  Transform.rotate(
                                    angle: hour,
                                    child: Divider(
                                      indent:
                                          MediaQuery.of(context).size.width /
                                              2.3,
                                      thickness: 3,
                                      endIndent: 80,
                                      color: Color(0xffF3BCC8),
                                    ),
                                  ),
                                  Transform.rotate(
                                    angle: min,
                                    child: Divider(
                                      indent:
                                          MediaQuery.of(context).size.width /
                                              2.3,
                                      thickness: 3,
                                      endIndent: 50,
                                      color: Color(0xffE893CF),
                                    ),
                                  ),
                                  Transform.rotate(
                                    angle: sec,
                                    child: Divider(
                                      indent:
                                          MediaQuery.of(context).size.width /
                                              2.30,
                                      thickness: 3,
                                      endIndent: 30,
                                      color: Color(0xffB799FF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff666666),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 25,
                          left: 25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "05:00 AM ",
                              style: TextStyle(fontSize: 30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Every day",
                                ),
                                Switch(
                                    value: switchCheak1,
                                    onChanged: (value) {
                                      switchCheak1 = value;
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff666666),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 25,
                          left: 25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "06:00 AM ",
                              style: TextStyle(fontSize: 30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Every day",
                                ),
                                Switch(
                                    value: switchCheak2,
                                    onChanged: (value) {
                                      switchCheak2 = value;
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff666666),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 25,
                          left: 25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "06:30 AM ",
                              style: TextStyle(fontSize: 30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Every day",
                                ),
                                Switch(
                                    value: switchCheak3,
                                    onChanged: (value) {
                                      switchCheak3 = value;
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff666666),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 25,
                          left: 25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "07:00 AM ",
                              style: TextStyle(fontSize: 30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Every day",
                                ),
                                Switch(
                                    value: switchCheak3,
                                    onChanged: (value) {
                                      switchCheak3 = value;
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff666666),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 25,
                          left: 25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "11:00 AM ",
                              style: TextStyle(fontSize: 30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Every day",
                                ),
                                Switch(
                                    value: switchCheak4,
                                    onChanged: (value) {
                                      switchCheak4 = value;
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff666666),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 25,
                          left: 25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "01:00 PM ",
                              style: TextStyle(fontSize: 30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Tue, 9 Apr",
                                ),
                                Switch(
                                    value: switchCheak5,
                                    onChanged: (value) {
                                      switchCheak5 = value;
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff666666),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 25,
                          left: 25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "07:00 PM ",
                              style: TextStyle(fontSize: 30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Mon, 15 Apr",
                                ),
                                Switch(
                                    value: switchCheak6,
                                    onChanged: (value) {
                                      switchCheak6 = value;
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
