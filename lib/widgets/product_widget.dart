import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_firebase/services/utils.dart';
import 'package:flutter_coffee_firebase/widgets/text_widget.dart';

import 'heart_btn.dart';

class Product_Widget extends StatelessWidget {
  const Product_Widget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FancyShimmerImage(
                imageUrl:
                    'https://cdn.pixabay.com/photo/2017/03/27/14/18/coffee-2179028_1280.jpg',
                height: size.height * 0.15,
                width: size.width * 0.6,
                boxFit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'Coffee', 
                      color: color, 
                      textSize: 18,
                      isTitle: true,
                    ),
                    HeartBTN(),
                  ],
                ),
              ),
              TextWidget(text: '70฿', color: color, textSize: 18, isTitle: true,),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: (){}, 
                  child: TextWidget(text: 'Add To Cart'.toUpperCase(), color: Colors.white, textSize: 14, isTitle: true,
                ),
                style: ButtonStyle(
                  backgroundColor: 
                  MaterialStateProperty.all(Colors.orangeAccent),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  ),
                ),
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
