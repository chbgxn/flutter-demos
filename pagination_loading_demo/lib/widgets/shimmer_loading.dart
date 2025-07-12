import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Shimmer.fromColors(
        baseColor: Colors.grey, 
        highlightColor: Colors.black,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: MediaQuery.of(context).size.height/11,
              width: MediaQuery.of(context).size.width,
              child:  ListTile(
                leading: Image.asset('assets/images/default_img.png', height: 30),
                title: Container(
                  height: 20,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.black
                  ),
                )
              )
            );
          },
        )
      )
    );
  }
}