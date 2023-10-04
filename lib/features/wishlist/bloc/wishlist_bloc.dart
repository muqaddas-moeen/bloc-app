import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/grocery_data.dart';
import 'package:bloc_app/data/wishlist_items.dart';
import 'package:meta/meta.dart';

import '../../../models/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistItemDeleteButtonClickedEvent>(
        wishlistItemDeleteButtonClickedEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(WishlistLoadedState(
        wishlistProducts: wishlistItems
            .map((e) => ProductDataModel(
                id: e.id,
                name: e.name,
                category: e.category,
                price: e.price,
                quantity: e.quantity,
                image: e.image))
            .toList()));
  }

  FutureOr<void> wishlistItemDeleteButtonClickedEvent(
      WishlistItemDeleteButtonClickedEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.clickedProduct);
    emit(WishlistLoadedState(wishlistProducts: wishlistItems));
  }
}
