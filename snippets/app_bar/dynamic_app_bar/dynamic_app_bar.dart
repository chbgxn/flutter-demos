// Author: @chbgxn
import 'package:flutter/material.dart';

class DynamicAppBar extends StatefulWidget {
  const DynamicAppBar({super.key});

  @override
  State<DynamicAppBar> createState() => _DynamicAppBarState();
}

class _DynamicAppBarState extends State<DynamicAppBar> {
  final ScrollController _scrollController = ScrollController();
  bool _show = false;

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
      appBar: _show?AppBar(title: Text("个人中心")):null,
      body: SafeArea(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 50,
          itemExtent: 50,
          itemBuilder: (BuildContext context, int index) {
            return Container( 
              margin: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.green,
              child: Text("$index"),
            );
          },
        ),
      ),
    );
  }
}