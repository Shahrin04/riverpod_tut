import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/model/product_model.dart';


final cartNotifierProvider = ChangeNotifierProvider<CartNotifier>((ref) => CartNotifier());

class CartNotifier extends ChangeNotifier{
  List<ProductModel> _cart = [];

  List<ProductModel> get cartList => _cart;

  addProduct(ProductModel product){
    _cart.add(product);
    notifyListeners();
  }

  removeProduct(ProductModel product){
    _cart.remove(product);
    notifyListeners();
  }

  clearCart(){
    _cart.clear();
    notifyListeners();
  }
}