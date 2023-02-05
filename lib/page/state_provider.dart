import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//final stateProvider = StateProvider<int>((ref)=> 120);
final stateProvider = StateProvider.autoDispose<int>((ref)=> 120);

class StateProviderPage extends ConsumerWidget{
  const StateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int value = ref.watch(stateProvider);
    ref.listen(stateProvider, (previous, next) {
      if(previous == 125){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Value is $next')));
      }
    });
    return Scaffold(
        appBar: AppBar(title: const Text('State Provider'),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Value is $value')),
            ElevatedButton(onPressed: (){
              ref.read(stateProvider.notifier).state++;
            },
                child: const Text('Increase')),
            ElevatedButton(onPressed: (){
              ref.invalidate(stateProvider);
            },
                child: const Text('Invalidate')),
          ],
        )
    );
  }
}
