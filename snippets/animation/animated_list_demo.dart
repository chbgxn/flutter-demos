/*
- [EN] AnimatedList
- Introduction:
- Use AnimatedList for an animated list and Riverpod for state management.

- [ZH] 动画列表
- 介绍：
- 使用 AnimatedList 实现一个动画列表，使用 Riverpod 进行状态管理。

- Author: chbgxn
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListNotifier extends StateNotifier<List<String>> {
  ListNotifier() : super([]){
    state = ['0', '1', '2', '3', '4'];
  }

  void addItem(String item){
    state = [...state, item];
  }

  void deleteItem(int index){
    final  data = state;
    data.removeAt(index);
    state = data;
  }
}

final listProvider = StateNotifierProvider<ListNotifier, List<String>>((ref) => ListNotifier());

class AnimatedListDemo extends ConsumerStatefulWidget{
  const AnimatedListDemo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AnimatedListDemoConsumerState();
}

class _AnimatedListDemoConsumerState extends ConsumerState<AnimatedListDemo> {
  final _listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(listProvider);
    final notifier = ref.read(listProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text('Animated List Demo')),
      body: SafeArea(
        child: AnimatedList(
          key: _listKey,
          initialItemCount: items.length,
          itemBuilder:(context, index, animation){
            return FadeTransition(
              opacity: animation,
              child: ListTile(
                title: Text(items[index]),
                trailing: IconButton(
                  onPressed: (){
                    notifier.deleteItem(index);
                    _listKey.currentState!.removeItem(
                      index, 
                      (context, animation) => Text('...')
                    );
                  }, 
                  icon: Icon(Icons.delete)
                ),
              )
            );
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _listKey.currentState!.insertItem(items.length);
          notifier.addItem('new item');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}