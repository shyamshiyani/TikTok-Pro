import 'dart:math';

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class strap_clock extends StatefulWidget {
  const strap_clock({super.key});

  @override
  State<strap_clock> createState() => _strap_clockState();
}

class _strap_clockState extends State<strap_clock> {
  DateTime time = DateTime.now();
  double sec = (3 * pi) / 2;
  int secDigital = 0;
  double min = (3 * pi) / 2;
  int minDigital = 0;
  double hour = (3 * pi) / 2;
  int hourDigital = 0;
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
        color: Color(0xff1A1A1A),
        title: NeumorphicText(
          "Strap Watch",
          style: const NeumorphicStyle(color: Colors.white, depth: 1),
          textStyle: NeumorphicTextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xff666666),
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
                        border:
                            NeumorphicBorder(width: 2, color: Colors.blueGrey),
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
                                indent: MediaQuery.of(context).size.width / 2.3,
                                thickness: 3,
                                endIndent: 80,
                                color: Color(0xffF3BCC8),
                              ),
                            ),
                            Transform.rotate(
                              angle: min,
                              child: Divider(
                                indent: MediaQuery.of(context).size.width / 2.3,
                                thickness: 3,
                                endIndent: 50,
                                color: Color(0xffE893CF),
                              ),
                            ),
                            Transform.rotate(
                              angle: sec,
                              child: Divider(
                                indent:
                                    MediaQuery.of(context).size.width / 2.30,
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
    );
  }
}
