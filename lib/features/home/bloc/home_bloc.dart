import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/cart_items.dart';
import 'package:bloc_app/data/grocery_data.dart';
import 'package:bloc_app/data/wishlist_items.dart';
import 'package:bloc_app/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeProductWishlistButtonNavigateEvent>(
        homeProductWishlistButtonNavigateEven);

    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEven);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                category: e['category'],
                price: e['price'],
                quantity: e['quantity'],
                image: e['image']))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Whishist product clicked');
    wishlistItems.add(event.clickedProduct);
    emit(HomeClickedToWishlistButtonActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart product clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeClickedToCartButtonActionState());
  }

  FutureOr<void> homeProductWishlistButtonNavigateEven(
      HomeProductWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Whishist navigate clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeProductCartButtonNavigateEven(
      HomeProductCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart navigate clicked');
    emit(HomeNavigateToCartPageActionState());
  }
}
