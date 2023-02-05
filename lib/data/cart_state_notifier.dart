import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/model/product_model.dart';

final cartStateNotifierProvider =
    StateNotifierProvider<CartStateNotifier, List<ProductModel>>(
        (ref) => CartStateNotifier());

class CartStateNotifier extends StateNotifier<List<ProductModel>> {
  CartStateNotifier() : super([]);

  addProduct(ProductModel product) {
    state = [...state, product];
  }

  clearCart() {
    state = [];
  }
}
