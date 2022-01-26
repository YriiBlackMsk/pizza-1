import 'package:flutter/material.dart';

const Color bgColor = Color.fromRGBO(200, 200, 200, 0.75);

ThemeData globalTheme() => ThemeData(
  fontFamily: 'Yanone',
  splashColor: const Color.fromRGBO(206, 188, 160, 1),

  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: Colors.brown,
  ).copyWith(

    secondary: Colors.grey,
  ),

  textTheme: TextTheme(
    headline3: TextStyle(
        fontSize: 48,
        fontFamily: 'Amatic',
        color: Colors.brown
    ),
    headline4: TextStyle(
        fontSize: 26,
        fontFamily: 'Yanone',
        color: Colors.brown
    ),
    headline5: TextStyle(
        fontSize: 22,
        fontFamily: 'Yanone',
        color: Colors.black
    ),
  ),
);