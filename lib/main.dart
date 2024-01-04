import 'package:flutter/material.dart';
import 'package:newspaper/screens/All.dart';
import 'package:newspaper/screens/Entertainment.dart';
import 'package:newspaper/screens/business.dart';
import 'package:newspaper/screens/health.dart';
import 'package:newspaper/screens/home.dart';
import 'package:newspaper/screens/science.dart';
import 'package:newspaper/screens/splash.dart';
import 'package:newspaper/screens/sports.dart';
import 'package:newspaper/screens/technology.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        'HomePage': (context) => const HomePage(),
        'DetailPage': (context) => const DetailPage(),
        'BusinessPage': (context) => const BusinessPage(),
        'EntertainmentPage': (context) => const EntertainmentPage(),
        'HealthPage': (context) => const HealthPage(),
        'SportsPage': (context) => const SportsPage(),
        'TechnologyPage': (context) => const TechnologyPage(),
        'SciencePage': (context) => const SciencePage(),
      },
    ),
  );
}