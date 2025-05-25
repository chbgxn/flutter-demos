import 'dart:async';
import 'package:flutter/material.dart';

class StandardCarousel extends StatefulWidget {
  const StandardCarousel({super.key});

  @override
  State<StandardCarousel> createState() => _StandardCarouselState();
}

class _StandardCarouselState extends State<StandardCarousel> {
  final PageController _pageController = PageController();
  Timer? _autoPlayTimer;
  int _currentIndex = 0;
  int _actualIndex = 0;
  final int _totIndex = 5;

  final List<String> imgs = [
    'assets/images/1.jpeg',
    'assets/images/2.jpeg',
    'assets/images/3.jpeg',
    'assets/images/4.jpeg',
    'assets/images/5.jpeg'
  ];

  @override
  void initState() {
    super.initState();
    _autoPlay();
  }

  @override
  void dispose() {
    _autoPlayTimer!.cancel();
    _pageController.dispose();
    super.dispose();
  }
  
  void _autoPlay(){
    _autoPlayTimer = Timer.periodic(
      Duration(seconds: 5), 
      (timer){
        _currentIndex++;
        _pageController.animateToPage(
          _currentIndex, 
          duration: Duration(milliseconds: 500), 
          curve: Curves.easeIn
        );
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: null,
        controller: _pageController,
        itemBuilder: (context, index){
          _actualIndex = index % _totIndex;
          return CarouselContent(img: imgs[_actualIndex],currentIndex: _actualIndex);
        }
      )
    );  
  }
}

class CarouselContent extends StatelessWidget {
  final String img;
  final int currentIndex;
  
  const CarouselContent({required this.img,required this.currentIndex,super.key});

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
  const CircularIndicator({required this.currentIndex,super.key});

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