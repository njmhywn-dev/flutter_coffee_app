import 'package:flutter/material.dart';
import 'package:flutter_coffee_firebase/provider/dark_theme_provider.dart';
import 'package:flutter_coffee_firebase/screens/btm_bar_screen.dart';
import 'package:flutter_coffee_firebase/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'const/theme_data.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppThmeme() async {
    themeChangeProvider.setDarkTheme =
     await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override

  void initState() {
    getCurrentAppThmeme();
    super.initState();
  }

  Widget build(BuildContext context) {
  
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        }) 
      ],
      child: Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Tung Black Coffee',
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeProvider.getDarkTheme , context),
            home: bottom_bar_screen(),
          );
        }
      ),
    );
  }
}
