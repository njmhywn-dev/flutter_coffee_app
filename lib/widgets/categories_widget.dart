import 'package:flutter/material.dart';
import 'package:flutter_coffee_firebase/provider/dark_theme_provider.dart';
import 'package:flutter_coffee_firebase/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class Categories_Widget extends StatelessWidget {
  const Categories_Widget({super.key, 
  required this.catText, 
  required this.imgPath, 
  required this.passedColor});
  final String catText, imgPath;
  final Color passedColor;
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    final themeState = Provider.of<DarkThemeProvider>(context);
    double _screenWidget = MediaQuery.of(context).size.width;
    final Color color = themeState.getDarkTheme? Colors.white : Colors.black;
    return  InkWell(
      onTap: (){
        print('selected');
      },
      child: Container(
        //height: _screenWidget * 0.6,
        decoration: BoxDecoration(
          color: passedColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: passedColor.withOpacity(0.7), 
            width: 2)
         ),
         child: Column(children: [
          Container(
            height: _screenWidget * 0.3,
            width: _screenWidget * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imgPath,
                ),
                fit: BoxFit.fill
              ),
            ),
          ),
          TextWidget(
            text: catText, 
            color: color, 
            textSize: 20,
            isTitle: true,
            ),
         ],),
      ),
    );
  }
}