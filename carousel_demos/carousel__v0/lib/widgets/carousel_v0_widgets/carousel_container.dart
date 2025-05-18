// Author: @chbgxn
import 'package:flutter/material.dart';
import 'slider_me.dart';

class CarouselContainer extends StatelessWidget {
  final String img;
  final int currentIndex;
  

  const CarouselContainer({required this.img,required this.currentIndex,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Image.asset(img),
          Positioned(
            bottom: 10,
            left: 100,
            child: SliderMe(currentIndex: currentIndex),
          ),
        ],
      ),
    );
  }
}
