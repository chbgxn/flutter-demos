// Author: @DevGalaxyCh
import 'package:flutter/material.dart';
import 'carousel_v0_widgets/carousel_container.dart';

class CarouselV0 extends StatefulWidget {
  const CarouselV0({super.key});

  @override
  State<CarouselV0> createState() => _CarouselV0State();
}

class _CarouselV0State extends State<CarouselV0> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

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
        itemCount: 5,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) => CarouselContainer(img: imgs[_currentIndex],currentIndex: _currentIndex)
      )
    );  
  }
}
