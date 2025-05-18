// Author: @chbgxn
import 'package:flutter/material.dart';

class SliderMe extends StatelessWidget {
  final int currentIndex;
  const SliderMe({required this.currentIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8)
      ),
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 20, 
            width: 20, 
            margin: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: currentIndex==index?Colors.orange:Colors.white,
              shape: BoxShape.circle
            ),
          );
        },
      ),
    );
  }
}
