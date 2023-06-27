import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/product.dart';

final cartStateNotifierProvider =
    StateNotifierProvider<CartStateNotifier, List<Product>>(
  (ref) {
    return CartStateNotifier();
  },
);

class CartStateNotifier extends StateNotifier<List<Product>> {
  CartStateNotifier() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }

  void removeProduct(Product product) {
    state = state.where((element) => element.id != product.id).toList();
  }

  void clearCart() {
    state = [];
  }
}
