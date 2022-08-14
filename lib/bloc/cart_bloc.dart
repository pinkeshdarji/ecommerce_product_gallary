import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/product.dart';
import 'event/cart_event.dart';
import 'state/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(ProductAdded(cartItem: []));

  final List<Product> _cartItems = [];
  List<Product> get items => _cartItems;
  bool isGridView = true;

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is AddProduct) {
      _cartItems.add(event.productIndex);
      yield ProductAdded(cartItem: _cartItems);
    } else if (event is RemoveProduct) {
      _cartItems.remove(event.productIndex);
      yield ProductRemoved(cartItem: _cartItems);
    } else if (event is ChangeGallaryView) {
      isGridView = event.isGridView;
      yield ChangeGallaryViewState(isGridView: isGridView);
    }
  }
}
