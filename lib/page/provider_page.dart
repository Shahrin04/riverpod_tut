import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final valueProvider = Provider<int>((ref) => 20);

class ProviderPage extends ConsumerWidget{
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Value Provider'),),
      body: Center(child: Text('Value is ${ref.watch(valueProvider)}'))
      /*Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Center(child: Text('Value is ${ref.watch(valueProvider)}'));
      },
      ),*/
    );
  }
}
