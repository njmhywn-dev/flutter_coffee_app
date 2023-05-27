import 'package:flutter/material.dart';
import 'package:flutter_coffee_firebase/screens/cart.dart';
import 'package:flutter_coffee_firebase/screens/categories.dart';
import 'package:flutter_coffee_firebase/screens/home_screen.dart';
import 'package:flutter_coffee_firebase/screens/user.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class bottom_bar_screen extends StatefulWidget {
  const bottom_bar_screen({super.key});

  @override
  State<bottom_bar_screen> createState() => _bottom_bar_screenState();
}

class _bottom_bar_screenState extends State<bottom_bar_screen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    { 
      'page' :  Home_Page(), 
      'title' : 'Home'
    },
    { 
      'page' :  Categories_Screen(), 
      'title' : 'Categories'
    },
    { 
      'page' :  Cart_Screen(), 
      'title' : 'Cart'
    },
    { 
      'page' :  User_Screen(), 
      'title' : 'User'
    },
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme ;
    return  Scaffold(
      //appBar: AppBar(title: Text(_pages[_selectedIndex]['title'],)),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDark
          ? Theme.of(context).cardColor 
          : Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        unselectedItemColor: _isDark ? Colors.white10 :Colors.black12,
        selectedItemColor: _isDark ? Colors.lightBlue[200] :Colors.black87,
        onTap: _selectedPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
            label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1 ? IconlyBold.category : IconlyLight.category),
            label: 'Categories'),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
            label: 'Cart'),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
            label: 'User'),                   
        ],
      ),
    );
  }
}