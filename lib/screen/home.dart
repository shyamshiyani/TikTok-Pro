import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
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
      drawer: Drawer(
        elevation: 1,
        shadowColor: Colors.white,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: SafeArea(
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            radius: 45,
                            foregroundImage: NetworkImage(
                                "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shyam Patel",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              Text(
                                "Rajkot",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 1.34,
                        width: double.infinity,
                        color: const Color(0xff1A1A1A),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 200,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      blurRadius: 15,
                                      color: Colors.white,
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.of(context)
                                          .pushNamed('Analog_clock');
                                    });
                                  },
                                  child: const Text(
                                    "Analog clock",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 200,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      blurRadius: 15,
                                      color: Colors.white,
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.of(context)
                                          .pushNamed('digital_clock');
                                    });
                                  },
                                  child: const Text(
                                    "Digital Clock",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 200,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      blurRadius: 15,
                                      color: Colors.white,
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.of(context)
                                          .pushNamed('strap_clock');
                                    });
                                  },
                                  child: const Text(
                                    "Strap Clock",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 200,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      blurRadius: 15,
                                      color: Colors.white,
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.of(context)
                                          .pushNamed('stop_watch');
                                    });
                                  },
                                  child: const Text(
                                    "Stop-Watch",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 200,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      blurRadius: 15,
                                      color: Colors.white,
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.of(context).pushNamed('timer');
                                    });
                                  },
                                  child: const Text(
                                    "Timer",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 200,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      blurRadius: 15,
                                      color: Colors.white,
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.of(context)
                                          .pushNamed('alaram_clock');
                                    });
                                  },
                                  child: const Text(
                                    "Alarm",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 200,
                      //   height: 200,
                      //   color: Colors.red,
                      // )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: NeumorphicAppBar(
        color: const Color(0xff1A1A1A),
        title: NeumorphicText(
          "Stop-Watch",
          curve: Curves.bounceOut,
          style: const NeumorphicStyle(
            color: Color(0xfffefefe),
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
                  color: const Color(0xff666666),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Neumorphic(
                            style: const NeumorphicStyle(
                              depth: -10,
                              intensity: 5,
                              boxShape: NeumorphicBoxShape.circle(),
                            ),
                            child: Container(
                              color: const Color(0xffEEEEEE),
                              height: 362,
                              width: 362,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    value: hourDigital * (1 / 12),
                                    color: const Color(0xffF3BCC8),
                                    strokeWidth: 12,
                                    strokeAlign: 15,
                                    strokeCap: StrokeCap.round,
                                  ),
                                  CircularProgressIndicator(
                                    value: minDigital * (1 / 60),
                                    color: const Color(0xffE893CF),
                                    strokeWidth: 12,
                                    strokeAlign: 20,
                                    strokeCap: StrokeCap.round,
                                  ),
                                  CircularProgressIndicator(
                                    value: secDigital * (1 / 60),
                                    color: const Color(0xffB799FF),
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
                                      color: const Color(0xffB799FF),
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
                                      color: const Color(0xffE893CF),
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
                                      color: const Color(0xffF3BCC8),
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
              color: const Color(0xff666666),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NeumorphicText(
                    "${formatTime(hourDigital)} : ${formatTime(minDigital)} : ${formatTime(secDigital)}",
                    style: const NeumorphicStyle(color: Color(0xffEEEEEE)),
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
                        style: const NeumorphicStyle(
                          color: Color(0xffEEEEEE),
                        ),
                        child: const Text(
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
                        style: const NeumorphicStyle(color: Color(0xffEEEEEE)),
                        child: const Text(
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
                        style: const NeumorphicStyle(color: Color(0xffEEEEEE)),
                        child: const Text(
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
