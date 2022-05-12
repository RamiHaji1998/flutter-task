import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: ConstColors.primaryColor,
      indicatorColor: ConstColors.primaryColor,
      scaffoldBackgroundColor: ConstColors.backgroundColor,
      backgroundColor: ConstColors.backgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: ConstColors.primaryColor,
          shape:
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                10.0
            ),
          ),
          textStyle: TextStyle(
            fontSize: 20,
            color: ConstColors.backgroundColor,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        isAlwaysShown: true,
        crossAxisMargin: 2,
        thumbColor: MaterialStateProperty.all(ConstColors.primaryColor),
        radius: const Radius.circular(20),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 25,
          color: ConstColors.primaryColor,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          fontSize: 20,
          color: ConstColors.primaryColor,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          fontSize: 15,
          color: ConstColors.secondaryColor,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w500,
        ),
        bodyText2: TextStyle(
          fontSize: 18,
          color: ConstColors.secondaryColor,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: IconThemeData(
        color: ConstColors.primaryColor,
        size: 35,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: ConstColors.secondaryColor,
        primary: ConstColors.primaryColor,
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: ConstColors.secondaryColor,
          size: 35,
        ),
        backgroundColor: ConstColors.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: ConstColors.primaryColor,
        labelPadding: const EdgeInsets.symmetric(vertical: 10),
        labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        unselectedLabelStyle:
        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        unselectedLabelColor: ConstColors.secondaryColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ConstColors.primaryColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ConstColors.backgroundColor,
        selectedItemColor: ConstColors.primaryColor,
        showSelectedLabels: false,
        unselectedItemColor: ConstColors.secondaryColor,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        elevation: 50,
      ),
    );
  }
}