import 'package:flutter/material.dart';
import 'cart_widget.dart';

class Cart_Screen extends StatelessWidget {
  const Cart_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Cart_Widget();
      },
    );
  }
}