import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_firebase/services/utils.dart';
import 'package:flutter_coffee_firebase/widgets/text_widget.dart';

class Cart_Widget extends StatefulWidget {
  const Cart_Widget({super.key});

  @override
  State<Cart_Widget> createState() => _Cart_WidgetState();
}

class _Cart_WidgetState extends State<Cart_Widget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final Size size = Utils(context).getscreenSize;
    return GestureDetector(
      onTap: (){},
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    height: size.height * 0.25,
                    width: size.width * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: FancyShimmerImage(imageUrl: '',
                    boxFit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: 'Coffee', color: color, textSize: 22,isTitle: true,),
                      Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Material(
                              color: color,
                              borderRadius: BorderRadius.circular(12),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {},
                                
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}