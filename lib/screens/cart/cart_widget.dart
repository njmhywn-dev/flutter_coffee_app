import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_coffee_firebase/services/utils.dart';
import 'package:flutter_coffee_firebase/widgets/heart_btn.dart';
import 'package:flutter_coffee_firebase/widgets/text_widget.dart';

class Cart_Widget extends StatefulWidget {
  const Cart_Widget({super.key});

  @override
  State<Cart_Widget> createState() => _Cart_WidgetState();
}

class _Cart_WidgetState extends State<Cart_Widget> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = '1';
    super.initState();
  }
  
  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final Size size = Utils(context).getscreenSize;
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.3),
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
                      child: FancyShimmerImage(
                        imageUrl:
                            "https://cdn.pixabay.com/photo/2015/05/07/13/46/cappuccino-756490_1280.jpg",
                        boxFit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Coffee',
                          color: color,
                          textSize: 22,
                          isTitle: true,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: size.width * 0.3,
                          child: Row(
                            children: [
                              _quantityController(
                                ftc: () {  }, 
                                color: Colors.red, 
                                icon: CupertinoIcons.minus
                              ),
                              Flexible(
                                flex: 1,
                                child: TextField(
                                  controller: _quantityTextController,
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(),),),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]')),
                                  ],
                                  onChanged: (v){
                                    setState(() {
                                      if(v.isEmpty){
                                        _quantityTextController.text = "1";
                                      }else{
                                        return;
                                      }
                                    });
                                  }, 
                                ),
                              ),
                              _quantityController(
                                ftc: () {  }, 
                                color: Colors.green, 
                                icon: CupertinoIcons.plus
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Icon(
                              CupertinoIcons.cart_badge_minus,
                              color: Colors.red,
                              size: 20, 
                            ),
                          ),
                          SizedBox(height: 5,),
                          HeartBTN(),
                          TextWidget(text: '70฿', color: color, textSize: 18, maxLines: 1,),
                        ],
                    ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _quantityController({
    required Function() ftc,
    required IconData icon,
    required Color color, 
    }) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: ftc,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
