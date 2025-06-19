/*
- [EN] Control the Display and Disappearance of AppBar
- Introductions:
- Set up an AppBar. When the scrolling offset is less than the set value,the AppBar will not display;
When greater than or equal to the set value, AppBar will display.
- Referring to the handling of AppBar on personal homepage by Taobao and Pinduoduo, and implement it.

- [ZH] 控制 AppBar 的显示与消失
- 介绍：
- 设置了一个 AppBar，当滚动总偏移量小于设定值时，AppBar 不会显示；大于等于设定值时，AppBar 会显示。
- 参考了淘宝、拼多多在个人主页对 AppBar 的处理，并实现。

- Author: chbgxn
*/

import 'package:flutter/material.dart';

class AppBarDisplay extends StatefulWidget {
  const AppBarDisplay({super.key});

  @override
  State<AppBarDisplay> createState() => _AppBarDisplayState();
}

class _AppBarDisplayState extends State<AppBarDisplay> {
  final ScrollController _scrollController = ScrollController();
  bool _show = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_listenOffset);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listenOffset);
    _scrollController.dispose();
    super.dispose();
  }

  void _listenOffset(){
    if(_scrollController.offset >=100){
      setState(() {
        _show = true;
      });
    }
    else{
      setState(() {
        _show = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _show?AppBar(title: const Text('个人中心')):null,
      body: SafeArea(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 50,
          itemExtent: 50,
          itemBuilder: (BuildContext context, int index) {
            return Container( 
              margin: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.green,
              child: Text(index.toString()),
            );
          },
        ),
      ),
    );
  }
}
