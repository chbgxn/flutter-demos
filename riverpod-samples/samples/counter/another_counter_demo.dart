import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter(): super(0);

  void increasement() => state++;
  void decreasement()=> state--;
  void zeroClearing() => state = 0;
}

final counterProvider = StateNotifierProvider<Counter, int>((ref) => Counter());

class AnotherCounterDemo extends ConsumerWidget{
  const AnotherCounterDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Text(count.toString(), style: TextStyle(fontSize: 64, color: Colors.red)),
          OutlinedButton(
            onPressed: () => ref.read(counterProvider.notifier).increasement(),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
              foregroundColor: WidgetStateProperty.all(Colors.white)
            ),
            child: Text('增加'), //increase
          ),

          OutlinedButton(
            onPressed: (){
              if(count == 0){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('通知: 不能小于0哦'))
                );
              }
              else{
                ref.read(counterProvider.notifier).decreasement();
              }
            }, 
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
              foregroundColor: WidgetStateProperty.all(Colors.white)
            ),
            child: Text('减少') //decrease
          ),

          OutlinedButton(
            onPressed: () => ref.read(counterProvider.notifier).zeroClearing(), 
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
              foregroundColor: WidgetStateProperty.all(Colors.white)
            ),
            child: Text('清零') //zero clearing
          )
        ],
      ),
   );
  }
}