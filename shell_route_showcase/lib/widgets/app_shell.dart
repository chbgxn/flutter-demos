import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shell_route_showcase/app_router.dart';

class AppShell extends StatelessWidget {
  final String currentLocation;
  final Widget child;

  const AppShell({super.key, required this.currentLocation, required this.child});

  int _getIndex(){
    if(currentLocation == AppRouter.home) return 0;
    if(currentLocation.startsWith(AppRouter.order)) return 1;
    if(currentLocation.startsWith(AppRouter.listOrder)) return 2;
    if(currentLocation.startsWith(AppRouter.profile)) return 3;
    return 0;
  }

  void _jumpToIndex(BuildContext context, int index){
    switch(index){
      case 0:
        context.go(AppRouter.home);
        break;
      case 1:
        context.go(AppRouter.pickup);
        break;
      case 2:
        context.go(AppRouter.listOrder);
        break;
      case 3:
        context.go(AppRouter.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getIndex(),
        onTap: (index) => _jumpToIndex(context, index),
        type: BottomNavigationBarType.fixed,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'order'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'record'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'profile'),
        ]
      ),
    );
  }
}