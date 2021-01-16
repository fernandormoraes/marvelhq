import 'package:flutter/material.dart';
import 'package:marvelhq/tema/tema.dart';
import 'package:marvelhq/views/onboarding.dart';
import 'package:marvelhq/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel HQ Library',
      debugShowCheckedModeBanner: false,
      theme: InformacoesTema(),
      initialRoute: OnBoardingScreen.routeName,
      routes: route,
    );
  }
}



