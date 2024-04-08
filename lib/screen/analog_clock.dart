import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class Analog_clock extends StatefulWidget {
  const Analog_clock({super.key});

  @override
  State<Analog_clock> createState() => _Analog_clockState();
}

class _Analog_clockState extends State<Analog_clock> {
  double sec = (3 * pi) / 2;
  double min = (3 * pi) / 2;
  double hour = (3 * pi) / 2;

  DateTime time = DateTime.now();
  int second = 0;
  int minute = 0;
  int hours = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      second = time.second;
      minute = time.minute;
      hours = time.hour;

      sec = sec + second * (pi / 30);
      min = min + minute * (pi / 30);
      hour = hour + hours * (pi / 30);
    });
    clock();
  }

  void clock() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(
          () {
            second++;
            sec = sec + (pi / 30);

            if (second >= 60) {
              second = 0;
              minute++;
              min = min + (pi / 30);
            } else if (minute >= 60) {
              minute = 0;
              hours++;
              hour = hour + (pi / 6);
            }

            // Calculate hour hand angle including minute fraction
            hour = (3 * pi / 2) +
                (hours % 12) * (pi / 6) +
                (minute / 60) * (pi / 6);

            clock();
          },
        );
      },
    );
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
          "Analog Watch",
          style: const NeumorphicStyle(
            color: Color(0xffCCCCCC),
            depth: 1,
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xff666666),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(1, -1),
                            blurRadius: 10,
                            spreadRadius: 1,
                            color: Colors.white)
                      ],
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.9),
                    ),
                    child: Stack(
                      children: [
                        Transform.rotate(
                          angle: hour,
                          child: Divider(
                            indent: MediaQuery.of(context).size.width / 2.8,
                            thickness: 3,
                            endIndent: 80,
                            color: Color(0xff1d1c21),
                          ),
                        ),
                        Transform.rotate(
                          angle: min,
                          child: Divider(
                            indent: MediaQuery.of(context).size.width / 2.8,
                            thickness: 3,
                            endIndent: 60,
                            color: Color(0xff474f52),
                          ),
                        ),
                        Transform.rotate(
                          angle: sec,
                          child: Divider(
                            indent: MediaQuery.of(context).size.width / 2.8,
                            thickness: 3,
                            endIndent: 40,
                            color: Color(0xff825432),
                          ),
                        ),
                        Transform.rotate(
                          angle: pi,
                          child: const Divider(
                            indent: 370,
                            thickness: 3,
                            color: Color(0xff5C4B51),
                          ),
                        ),
                        Transform.rotate(
                          angle: pi / 2,
                          child: const Divider(
                            indent: 370,
                            thickness: 3,
                            color: Color(0xff5C4B51),
                          ),
                        ),
                        Transform.rotate(
                          angle: 3 * pi / 2,
                          child: const Divider(
                            indent: 370,
                            thickness: 3,
                            color: Color(0xff5C4B51),
                          ),
                        ),
                        Transform.rotate(
                          angle: 4 * pi / 2,
                          child: const Divider(
                            indent: 370,
                            thickness: 3,
                            color: Color(0xff5C4B51),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
