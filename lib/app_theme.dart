import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final mainColorMap = {
  50: Colors.orange,
  100: Colors.orange,
  200: Colors.orange,
  300: Colors.orange,
  400: Colors.orange,
  500: Colors.orange,
  600: Colors.orange,
  700: Colors.orange,
  800: Colors.orange,
  900: Colors.orange,
};
final MaterialColor mainColor = MaterialColor(Colors.orange.value, mainColorMap);
Color bgPrimary = Color(0xFF41403D);
Color primaryColor = Colors.orange;
double defSpacing = 16.0;

ThemeData appTheme = ThemeData(
  primarySwatch: mainColor,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: bgPrimary,
  appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      centerTitle: true,
      backgroundColor: bgPrimary,
      backwardsCompatibility: false,
      titleTextStyle: TextStyle(color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: primaryColor)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: bgPrimary),
);
