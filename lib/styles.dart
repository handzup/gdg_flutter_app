import 'package:flutter/material.dart';

abstract class Styles {
  static const primaryColor = Color(0xFFf5f5f5);

  static const TextStyle defaultTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600);
  static const TextStyle defaultTextStyleBlack = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600);
  static const TextStyle defaultCardSmallText = TextStyle(
      color: Colors.black26,
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600);
  static const TextStyle defaultCardSmallTextBlack = TextStyle(
      color: Colors.white70,
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600);

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme ? Colors.black : primaryColor,
      primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Colors.black : primaryColor,
      backgroundColor: isDarkTheme ? Colors.black : primaryColor,
      textTheme: TextTheme(
          headline1: isDarkTheme ? defaultTextStyleBlack : defaultTextStyle,
          headline2:
              isDarkTheme ? defaultCardSmallTextBlack : defaultCardSmallText),
      buttonColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF222a3e) : Colors.white,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
