import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color.fromRGBO(206, 33, 255, 1),
    brightness: Brightness.light,
    primaryColorLight: Colors.white,
    indicatorColor: Colors.grey[100],
    selectedRowColor: const Color.fromRGBO(206, 33, 255, 1),
    highlightColor: const Color.fromRGBO(206, 33, 255, 1),
    shadowColor: Colors.black,
    useMaterial3: true,
    fontFamily: 'Baloo Da',
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromRGBO(206, 33, 255, 1),
    indicatorColor: const Color.fromRGBO(206, 33, 255, 1),
    selectedRowColor: Colors.white,
    shadowColor: Colors.white,
    primaryColorDark: Color.fromRGBO(32, 28, 28, 1),
    highlightColor: const Color.fromRGBO(206, 33, 255, 1),
    fontFamily: 'Baloo Da',
    useMaterial3: true,
  );
}
