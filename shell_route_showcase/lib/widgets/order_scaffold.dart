import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shell_route_showcase/app_router.dart';

enum OrderType{ pickup, takeout }

class OrderScaffold extends StatelessWidget {
  final OrderType orderType;
  final Widget child;

  const OrderScaffold({super.key, required this.orderType, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 8,
          children: [
            TextButton(
              onPressed: () => context.go(AppRouter.pickup), 
              child: Text(
                'PICKUP', 
                style: TextStyle(color: orderType==OrderType.pickup?Colors.red:Colors.black)
              )
            ),
            TextButton(
              onPressed: () => context.go(AppRouter.takeout) , 
              child: Text(
                'TAKEOUT',
                style: TextStyle(color: orderType==OrderType.takeout?Colors.red:Colors.black)
              )
            )
          ],
        ),
      ),
      body: child,
    );
  }
}