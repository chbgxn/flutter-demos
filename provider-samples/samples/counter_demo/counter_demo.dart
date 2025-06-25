import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void add(){
    _count++;
    notifyListeners();
  }

  void decrease(){
    _count > 0 ? _count-- : _count = 0;
    notifyListeners();
  }

  void reset(){
    _count = 0;
    notifyListeners();
  }
}

class CounterDemo extends StatelessWidget {
  const CounterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Provider')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Text('${counterProvider.count}'),
            OutlinedButton(
              onPressed: () => counterProvider.add(), 
              child: const Text('add')
            ),
            OutlinedButton(
              onPressed: () => counterProvider.decrease(), 
              child: const Text('decrease')
            ),
            OutlinedButton(
              onPressed: () => counterProvider.reset(), 
              child: const Text('reset')
            )
          ],
        ),
      ),
    );
  }
}