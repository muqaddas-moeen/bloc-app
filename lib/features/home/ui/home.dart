import 'package:bloc_app/features/cart/ui/cart.dart';
import 'package:bloc_app/features/home/bloc/home_bloc.dart';
import 'package:bloc_app/features/home/ui/product_tile_widget.dart';
import 'package:bloc_app/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) {
        return current is HomeActionState;
      },
      buildWhen: (previous, current) {
        return current is! HomeActionState;
      },
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CartScreen()));
        }
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const WishListScreen()));
        }
        if (state is HomeClickedToWishlistButtonActionState) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item added in wishlist')));
        }
        if (state is HomeClickedToCartButtonActionState) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item added in cart')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Grocery App'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductWishlistButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductCartButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.shopping_bag_outlined)),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) => ProductTileWidget(
                        productDataModel: successState.products[index],
                        homeBloc: homeBloc,
                      )),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return Container(
              child: const Text('Ooops! Something happened....'),
            );
        }
      },
    );
  }
}
