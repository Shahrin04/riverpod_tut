import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/data/cart_notifier.dart';
import 'package:riverpod_tut/model/product_model.dart';


class ChangeNotifierPage extends ConsumerWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  showBox(BuildContext context, CartNotifier cartNotifier, WidgetRef ref){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Center(child: Text('Cart')),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...cartNotifier.cartList.map((item) => Text(item.title)),
            const SizedBox(height: 10,),
            Text('Total: ${cartNotifier.cartList.fold<double>(0, (sum, item) => sum + item.price)}',
              style: const TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
        actions: [
          TextButton(onPressed: (){
            ref.read(cartNotifierProvider.notifier).clearCart();
            Navigator.pop(context);
      }, child: const Text("Clear"))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider'),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: (){
                    showBox(context, cartNotifier, ref);
                  },
                  icon: const Icon(Icons.shopping_cart)),
              Positioned(
                right: 10,
                  bottom: 15,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 15,
                      minHeight: 15
                    ),
                    child: Text('${cartNotifier.cartList.length}', style: TextStyle(fontSize: 12), textAlign: TextAlign.center,),
                  ))
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: productList.length,
                  itemBuilder: (context, index){
                  final product = productList[index];
                  return ListTile(
                    title: Text(product.title),
                    subtitle: Text(product.description),
                    trailing: IconButton(
                        onPressed: (){
                          ref.read(cartNotifierProvider.notifier).addProduct(product);
                        },
                        icon: const Icon(Icons.add_shopping_cart_rounded)),
                  );
                  }
              )
          )
        ],
      ),
    );
  }
}
