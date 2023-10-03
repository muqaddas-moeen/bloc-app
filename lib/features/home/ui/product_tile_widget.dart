import 'package:bloc_app/data/cart_items.dart';
import 'package:bloc_app/data/wishlist_items.dart';
import 'package:bloc_app/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatefulWidget {
  const ProductTileWidget({super.key, required this.productDataModel});

  final ProductDataModel productDataModel;

  @override
  State<ProductTileWidget> createState() => _ProductTileWidgetState();
}

class _ProductTileWidgetState extends State<ProductTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      //padding: const EdgeInsets.only(top: 20),
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Image.network(
            widget.productDataModel.image,
          ),
          ListTile(
              title: Text(
                widget.productDataModel.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Text('\$ ${widget.productDataModel.price}'),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        //print('Before: ${wishlistItems[0]}');
                        wishlistItems.add(widget.productDataModel);
                        print(wishlistItems[0]);
                        //homeBloc.add(HomeProductWishlistButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {
                        //cartItems.add(widget.productDataModel);
                        // homeBloc.add(HomeProductCartButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.shopping_bag_outlined)),
                ],
              ))
        ],
      ),
    );
  }
}
