/*
- [EN] Control the Display And Disappearance of the "back-to-top" button
- Introductions:
- use ListView.builder() and the itemExtend property to improve list performance.
- a "back-to-top" button has been set up, which can be clicked to return to the top.
- When the offset of scrolling is less than the set value, the button will not be displayed; 
When it is greater than or equal to the set value, the button will be displayed.

- [CN] 控制“回到顶部”按钮的显示与消失
- 介绍:
- 使用ListView.builder()和itemExtent属性提升列表性能。
- 设置了一个“回到顶部”按钮，点击可以回到顶部。
- 当滚动总偏移量小于设定值时，“回到顶部”按钮不会显示；大于等于设定值时，按钮会显示。

- Author: chbgxn
*/

import 'package:flutter/material.dart';

class BackToTopButton extends StatefulWidget {
  const BackToTopButton({super.key});

  @override
  State<BackToTopButton> createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<BackToTopButton> {
  final ScrollController _scrollController = ScrollController();
  bool _showBtn = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(listenOffset);
  }

  @override
  void dispose() {
    _scrollController.removeListener(listenOffset);
    _scrollController.dispose();
    super.dispose();
  }

  void listenOffset(){
    if(_scrollController.offset>=1000){
      setState(() {
        _showBtn = true;
      });
    }
    else{
      setState(() {
        _showBtn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('回到顶部')),
      body: ListView.builder(
        itemCount: 50,
        itemExtent: 50,
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(bottom: 8),
            color: Colors.blue,
            child: ListTile(title: Text(index.toString())),
          );
        },
      ),
      floatingActionButton:
          _showBtn
              ? FloatingActionButton(
                  onPressed: () {
                    _scrollController.animateTo(
                      0, 
                      duration: Duration(microseconds: 500), 
                      curve: Curves.ease
                    );
                  },
                  child: Icon(Icons.arrow_upward),
                )
              : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
