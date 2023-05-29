import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_firebase/services/utils.dart';
import 'package:flutter_coffee_firebase/widgets/text_widget.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../widgets/cart_coffee_widget.dart';
import '../widgets/product_widget.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    final Utils color = Utils(context);
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = Utils(context).getscreenSize;
    Color getcolor = Utils(context).color;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return FancyShimmerImage(
                    imageUrl:
                        'https://cdn.pixabay.com/photo/2015/06/24/01/15/coffee-819362_1280.jpg',
                  );
                },
                autoplay: true,
                itemCount: 3,
                pagination: SwiperPagination(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: 'Best Seller'.toUpperCase(),
                        color: Colors.red,
                        textSize: 22,
                        isTitle: true,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        IconlyLight.ticketStar,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.24,
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return CartCoffeeWidget(getcolor: getcolor);
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Products',
                          color: getcolor,
                          textSize: 24,
                          isTitle: true,
                        ),
                      ],
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: size.width / (size.height * 0.63),
                      children: List.generate(10, (index) {
                        return Product_Widget(size: size,);
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

