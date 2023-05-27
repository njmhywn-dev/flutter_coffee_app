import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: 
        isDarkTheme ?  Color.fromARGB(255, 4, 1, 16) :  Colors.white,
      primaryColor: Colors.blue,
      colorScheme: ThemeData().colorScheme.copyWith(
        secondary: 
          isDarkTheme ? Colors.indigo[50] : Colors.white,
        brightness: 
          isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      cardColor: 
        isDarkTheme ? Colors.black54 : Colors.white,
      canvasColor: 
        isDarkTheme ? Colors.black : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: 
          isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light()
      ),
    );
  }
}