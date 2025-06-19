/*
- [EN] Implementation of Basic Carousel
- Introductions:
- Implement a carousel by PageView
- Add circular indicator
- AutoPlay ❌

- [CN] 基本轮播图的实现
- 介绍：
- 使用PageView实现一个轮播图
- 增加圆形指示器
- 自动播放 ❌

- Author: chbgxn
*/

import 'package:flutter/material.dart';

class BasicCarousel extends StatefulWidget {
  const BasicCarousel({super.key});

  @override
  State<BasicCarousel> createState() => _BasicCarouselState();
}

class _BasicCarouselState extends State<BasicCarousel> {
  final PageController _pageController = PageController();

  final List<String> imgs = [
    'assets/images/1.jpeg',
    'assets/images/2.jpeg',
    'assets/images/3.jpeg',
    'assets/images/4.jpeg',
    'assets/images/5.jpeg'
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: imgs.length,
        controller: _pageController,
        itemBuilder: (context, index) => CarouselContent(img: imgs[index], currentIndex: index)
      )
    );  
  }
}

class CarouselContent extends StatelessWidget {
  final String img;
  final int currentIndex;
  
  const CarouselContent({required this.img, required this.currentIndex, super.key});

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
            child: CircularIndicator(currentIndex: currentIndex),
          ),
        ],
      ),
    );
  }
}

class CircularIndicator extends StatelessWidget {
  final int currentIndex;
  const CircularIndicator({required this.currentIndex, super.key});

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
