import 'package:flutter/material.dart';
import 'package:marvelhq/views/main/screenComics.dart';
import 'package:marvelhq/views/main/home.dart';
import 'package:marvelhq/views/onboarding.dart';
import 'package:marvelhq/views/entrar/signin_screen.dart';

final Map<String, WidgetBuilder> route = {
  OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ScreenComics.routeName: (context) => ScreenComics(),
  HomePage.routeName: (context) => HomePage(usuario: null,),
};
