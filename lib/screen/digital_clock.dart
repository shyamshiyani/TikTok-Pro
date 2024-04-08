import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({Key? key}) : super(key: key);

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  double sec = (3 * pi) / 2;
  double min = (3 * pi) / 2;
  double hour = (3 * pi) / 2;

  late Timer _timer;
  late String convertTime;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateTime());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    final DateTime now = DateTime.now();
    setState(() {
      sec = (3 * pi / 2) + (now.second * (pi / 30));
      min = (3 * pi / 2) + (now.minute * (pi / 30));
      hour = (3 * pi / 2) +
          (now.hour % 12 * (pi / 6)) +
          (now.minute / 2 * (pi / 30));

      final int hours = now.hour % 12 == 0 ? 12 : now.hour % 12;
      final String ampm = now.hour < 12 ? 'AM' : 'PM';
      convertTime =
          '${addLeadingZero(hours)}:${addLeadingZero(now.minute)}:${addLeadingZero(now.second)} $ampm';
    });
  }

  String addLeadingZero(int number) {
    if (number < 10) {
      return '0$number';
    }
    return number.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        color: const Color(0xff1A1A1A),
        title: NeumorphicText(
          "Digital Watch",
          style: const NeumorphicStyle(
            color: Colors.white,
            depth: 1,
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xff666666),
        child: Text(
          "${convertTime}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
