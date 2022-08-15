import 'package:ecomm_app/product_detail_widget.dart';
import 'package:ecomm_app/widgets/product_tile_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import '../bloc/state/cart_state.dart';
import '../models/product.dart';
import 'product_tile.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
      bool isGridView = cartState.isGridView;
      if (isGridView) {
        return LayoutBuilder(builder: (context, constraints) {
          return GridView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) => ProductTileAnimation(
              itemNo: index,
              product: products[index],
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: constraints.maxWidth > 700 ? 4 : 2,
              childAspectRatio: 1,
            ),
          );
        });
      } else {
        return ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductTileAnimation(
                itemNo: index,
                product: products[index],
              );
            });
      }
    });

    return LayoutBuilder(builder: (context, constraints) {
      return GridView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailWidget(
                  product: products[index],
                ),
              ),
            );
          },
          child: ProductTile(
            itemNo: index,
            product: products[index],
          ),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
      );
    });
  }
}

///////
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc_demo/with_bloc/bloc/cart_bloc.dart';
// import 'package:flutter_bloc_demo/with_bloc/bloc/state/cart_state.dart';
//
// import 'product_tile.dart';
//
// class ProductList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<CartBloc, CartState>(listener: (context, state) {
//       Scaffold.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//               state is ProductAdded ? 'Added to cart.' : 'Removed from cart.'),
//           duration: Duration(seconds: 1),
//         ),
//       );
//     }, builder: (_, cartState) {
//       List<int> cart = cartState.cartItem;
//       return LayoutBuilder(builder: (context, constraints) {
//         return GridView.builder(
//           itemCount: 100,
//           itemBuilder: (context, index) => ProductTile(
//             itemNo: index,
//             cart: cart,
//           ),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: constraints.maxWidth > 700 ? 4 : 1,
//             childAspectRatio: 5,
//           ),
//         );
//       });
//     });
//   }
// }
