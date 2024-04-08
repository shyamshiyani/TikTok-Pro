import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:ticktockpro/screen/alaram_clock.dart';
import 'package:ticktockpro/screen/analog_clock.dart';
import 'package:ticktockpro/screen/digital_clock.dart';
import 'package:ticktockpro/screen/home.dart';
import 'package:ticktockpro/screen/stop-watch.dart';
import 'package:ticktockpro/screen/strap_clock.dart';
import 'package:ticktockpro/screen/timer.dart';

void main() {
  runApp(
    NeumorphicApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Homepage(),
        'Analog_clock': (context) => const Analog_clock(),
        'digital_clock': (context) => const DigitalClock(),
        'strap_clock': (context) => const strap_clock(),
        'stop_watch': (context) => const stop_watch(),
        'alaram_clock': (context) => const alaram_clock(),
        'timer': (context) => const TimerApp(),
      },
    ),
  );
}
