import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class CounterDemo extends ConsumerWidget{
  const CounterDemo({super.key});

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
          onPressed: () => ref.read(counterProvider.notifier).state++,
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
                SnackBar(content: const Text('不能小于0哦'))
              );
            }
            else{
              ref.read(counterProvider.notifier).state--;
            }
          }, 
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
            foregroundColor: WidgetStateProperty.all(Colors.white)
          ),
          child: Text('减少') //decrease
        ),

        OutlinedButton(
          onPressed: () => ref.read(counterProvider.notifier).state = 0, 
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