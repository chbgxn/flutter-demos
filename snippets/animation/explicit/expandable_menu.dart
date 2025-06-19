/*
- [EN] Expandable Menu
- Introductions:
- This code shows the animation of opening and closing the menu after clicking the button.

- [ZH] 伸缩菜单
- 介绍：
- 这段代码展现了点击按钮后，打开与关闭菜单的动画。

- Author: chbgxn
*/

import 'package:flutter/material.dart';

class ExpandableMenu extends StatefulWidget {
  const ExpandableMenu({super.key});

  @override
  State<ExpandableMenu> createState() => _ExpandableMenuState();
}

class _ExpandableMenuState extends State<ExpandableMenu> with SingleTickerProviderStateMixin{
  late final AnimationController _controller;
  late final Animation<double> _animation;
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this
    );
    _animation = CurvedAnimation(
      parent: _controller, 
      curve: Curves.fastOutSlowIn
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('伸缩菜单')),
      body: SizeTransition(
        sizeFactor: _animation,
        child: SizedBox(
          width: 200,
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(leading: const Icon(Icons.home), title: const Text('首页')),
              ListTile(leading: const Icon(Icons.add), title: const Text('增加')),
              ListTile(leading: const Icon(Icons.people), title: const Text('我的')),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_expanded?Icons.close:Icons.menu),
        onPressed:(){
          setState(() {
            _expanded = !_expanded;
            _expanded?_controller.forward():_controller.reverse();
          });
        }
      ),
    );
  }
}
