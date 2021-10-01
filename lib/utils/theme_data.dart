import 'package:flutter/material.dart';

class GlobalData {
  static ThemeData themeData = ThemeData(
    // scaffoldBackgroundColor: Colors.grey,
    primaryColor: Colors.teal,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      bodyText2: TextStyle(color: Colors.black),
    ),
  );

  static ThemeData darkThemeData = ThemeData(
    // scaffoldBackgroundColor: Color(0xff111111),
    primaryColor: Color(0xff212121),
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      bodyText2: TextStyle(color: Colors.white),
    ),
    // appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white),),
    //   iconTheme: IconThemeData()
  );
  static ThemeMode themeMode = ThemeMode.dark;
}
