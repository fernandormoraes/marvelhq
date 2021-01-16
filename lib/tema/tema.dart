import 'package:flutter/material.dart';
import 'package:marvelhq/constants.dart';

// ignore: non_constant_identifier_names
ThemeData InformacoesTema() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      color: Colors.white,
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Color(0xFF888888),
          fontSize: 18.0,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    primaryColor: kPrimaryColor,
    accentColor: kPrimaryColor,
    fontFamily: 'Montserrat',
    backgroundColor: Colors.white,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
