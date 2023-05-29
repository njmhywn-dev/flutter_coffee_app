import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_coffee_firebase/services/utils.dart';
import 'package:flutter_coffee_firebase/widgets/text_widget.dart';
import 'cart_widget.dart';

class Cart_Screen extends StatelessWidget {
  Cart_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final Size size = Utils(context).getscreenSize;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Cart (2)', 
          color: color, 
          textSize: 18,
          isTitle: true,
          ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.delete, 
            color: color, 
            size: 20,
          ),
          ),
        ],
        ),
      body: Column(
        children: [
          _checkput(ctx: context),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Cart_Widget();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkput ({required BuildContext ctx}){
    final Color color = Utils(ctx).color;
    final Size size = Utils(ctx).getscreenSize;
    return SizedBox(
            width: double.infinity,
            height: size.height * 0.1,
            //color: ,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(children: [
                Material(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextWidget(text: 'Order Now', color: color, textSize: 18),
                    ),
                  ),
                ),
                Spacer(),
                FittedBox(
                  child: TextWidget(
                    text: 'Total: 70฿', 
                    color: color, 
                    textSize: 18, 
                    isTitle: true,
                  ),
                ),
              ],
            ),
            ),
          );
  }

}