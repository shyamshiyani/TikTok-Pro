import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class stop_watch extends StatefulWidget {
  const stop_watch({Key? key}) : super(key: key);

  @override
  State<stop_watch> createState() => _stop_watchState();
}

class _stop_watchState extends State<stop_watch> {
  late Stopwatch stopwatch;
  late Timer timer;

  double sec = (3 * pi) / 2;
  int secDigital = 0;
  double min = (3 * pi) / 2;
  int minDigital = 0;
  double hour = (3 * pi) / 2;
  int hourDigital = 0;

  @override
  void initState() {
    super.initState();

    stopwatch = Stopwatch();

    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        secDigital = stopwatch.elapsed.inSeconds % 60;
        minDigital = stopwatch.elapsed.inMinutes % 60;
        hourDigital = stopwatch.elapsed.inHours % 12;

        sec = (3 * pi) / 2 + secDigital * (pi / 30);
        min = (3 * pi) / 2 + minDigital * (pi / 30);
        hour = (3 * pi) / 2 + hourDigital * (pi / 6);
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String formatTime(int time) {
    if (time < 10) {
      return '0$time';
    } else {
      return '$time';
    }
  }

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
        color: Colors.black,
        title: NeumorphicText(
          "Stop-Watch",
          curve: Curves.bounceOut,
          style: NeumorphicStyle(
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
            flex: 6,
            child: Stack(
              children: [
                Container(
                  color: Color(0xff666666),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Neumorphic(
                            style: NeumorphicStyle(
                              depth: -10,
                              intensity: 5,
                              boxShape: NeumorphicBoxShape.circle(),
                            ),
                            child: Container(
                              color: Color(0xffEEEEEE),
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Color(0xff666666),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NeumorphicText(
                    "${formatTime(hourDigital)} : ${formatTime(minDigital)} : ${formatTime(secDigital)}",
                    style: NeumorphicStyle(color: Color(0xffEEEEEE)),
                    textStyle: NeumorphicTextStyle(fontSize: 60),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NeumorphicButton(
                        onPressed: () {
                          setState(() {
                            stopwatch.reset();
                            stopwatch.start();
                          });
                        },
                        style: NeumorphicStyle(
                          color: Color(0xffEEEEEE),
                        ),
                        child: Text(
                          "Start",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff99BC85),
                          ),
                        ),
                      ),
                      NeumorphicButton(
                        onPressed: () {
                          setState(() {
                            stopwatch.stop();
                          });
                        },
                        style: NeumorphicStyle(color: Color(0xffEEEEEE)),
                        child: Text(
                          "Stop",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff99BC85),
                          ),
                        ),
                      ),
                      NeumorphicButton(
                        onPressed: () {
                          setState(() {
                            stopwatch.reset();
                          });
                        },
                        style: NeumorphicStyle(color: Color(0xffEEEEEE)),
                        child: Text(
                          "Reset",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff99BC85),
                          ),
                        ),
                      ),
                    ],
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
