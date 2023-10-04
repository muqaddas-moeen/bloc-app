import 'package:bloc_app/data/wishlist_items.dart';
import 'package:bloc_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_app/features/wishlist/ui/wishlist_product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishlistBloc,
      listenWhen: (previous, current) {
        return current is WishlistActionState;
      },
      buildWhen: (previous, current) {
        return current is! WishlistActionState;
      },
      listener: (context, state) {
        if (state is WishlistLoadedState) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item deleted from wishlist')));

          print(wishlistItems[0].name);
          print(wishlistItems[1].name);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case WishlistLoadingState:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case WishlistLoadedState:
            final successState = state as WishlistLoadedState;
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Favourites'),
                ),
                body: ListView.builder(
                    itemCount: successState.wishlistProducts.length,
                    itemBuilder: (context, index) => WishlistProductTileWidget(
                          wishlistProducts:
                              successState.wishlistProducts[index],
                          wishlistBloc: wishlistBloc,
                        )));
          case WishlistErorState:
            return const Scaffold(
              body: Center(child: Text('Error')),
            );
          default:
            return const Scaffold(
              body: Center(child: Text('Ooops! Something goes wrong.....')),
            );
        }
      },
    );
  }
}
