import 'package:flutter/material.dart';
import 'package:flutter_coffee_firebase/widgets/text_widget.dart';

import '../services/utils.dart';
import '../widgets/categories_widget.dart';

class Categories_Screen extends StatelessWidget {
   Categories_Screen({super.key});

  List <Color> gridColor = [
    Colors.red, Colors.blue, Colors.amber
  ];
  List<Map<String, dynamic>> CatInfo = [
    {
      'imgPath': 'assets/images/coffee_01.jpg',
      'catText': 'Coffee 1',
    },
    {
      'imgPath': 'assets/images/coffee_02.jpg',
      'catText': 'Coffee 2',
    },
    {
      'imgPath': 'assets/images/coffee_03.jpg',
      'catText': 'Coffee 3',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
        text: 'Categories', 
        color: color, 
        textSize: 24,
        isTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 240/250,
        crossAxisSpacing: 30,
        mainAxisSpacing: 10,
        children: List.generate(CatInfo.length, (index) {
          return Categories_Widget(
            catText: CatInfo[index]['catText'], 
            imgPath: CatInfo[index]['imgPath'],
            passedColor: gridColor[index], 
          );
        }),
        ),
      ),
    );
  }
}