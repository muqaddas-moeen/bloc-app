import 'package:bloc_app/models/home_product_data_model.dart';
import 'package:bloc_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

class WishlistProductTileWidget extends StatelessWidget {
  const WishlistProductTileWidget(
      {super.key, required this.wishlistProducts, required this.wishlistBloc});
  final ProductDataModel wishlistProducts;
  final WishlistBloc wishlistBloc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        wishlistProducts.image,
      ),
      title: Text(wishlistProducts.name),
      subtitle: Text('\$ ${wishlistProducts.price}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outlined),
        onPressed: () {
          wishlistBloc.add(WishlistItemDeleteButtonClickedEvent(
              clickedProduct: wishlistProducts));
        },
      ),
    );
  }
}
