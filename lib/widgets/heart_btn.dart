import 'package:flutter/material.dart';
import 'package:flutter_coffee_firebase/services/utils.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HeartBTN extends StatelessWidget {
  HeartBTN({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return GestureDetector(
      onTap: (){},
      child: Icon(IconlyLight.heart,
      size: 22,
      color: color,
      ),
    );
  }
}