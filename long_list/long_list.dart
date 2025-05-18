import 'package:flutter/material.dart';

class LongList extends StatefulWidget {
  const LongList({super.key});

  @override
  State<LongList> createState() => _LongListState();
}

class _LongListState extends State<LongList> {
  final ScrollController _scrollController = ScrollController();
  bool showBtn = false;

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
        showBtn = true;
      });
    }
    else{
      setState(() {
        showBtn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("长列表")),
      body: ListView.builder(
        itemCount: 50,
        itemExtent: 50,
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(bottom: 8),
            color: Colors.blue,
            child: ListTile(title: Text("$index")),
          );
        },
      ),
      floatingActionButton:
          showBtn
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
