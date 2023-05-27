import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_firebase/widgets/text_widget.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';

class CartCoffeeWidget extends StatefulWidget {
  const CartCoffeeWidget({
    super.key,
    required this.getcolor,
  });

  final Color getcolor;

  @override
  State<CartCoffeeWidget> createState() => _CartCoffeeWidgetState();
}

class _CartCoffeeWidgetState extends State<CartCoffeeWidget> {
  @override
  Widget build(BuildContext context) {
    
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getscreenSize;

    return Material(
      color: Theme.of(context).cardColor.withOpacity(0.9),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FancyShimmerImage( imageUrl:
                    "https://cdn.pixabay.com/photo/2015/05/07/13/46/cappuccino-756490_1280.jpg",
                    width: size.width * 0.22,
                    height: size.height * 0.1,
                    boxFit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    text: 'Coffee',
                    color: widget.getcolor,
                    textSize: 18,
                    isTitle: true,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  TextWidget(text: '70฿', color: widget.getcolor, textSize: 16),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          IconlyLight.bag2,
                          size: 22,
                          color: widget.getcolor,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          IconlyLight.heart,
                          size: 22,
                          color: widget.getcolor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
