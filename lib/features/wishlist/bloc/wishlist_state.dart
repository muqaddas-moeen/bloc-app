part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

class WishlistLoadingState extends WishlistState {}

class WishlistLoadedState extends WishlistState {
  final List<ProductDataModel> wishlistProducts;

  WishlistLoadedState({required this.wishlistProducts});
}

class WishlistErorState extends WishlistState {}

class WishlistItemDeletedActionState extends WishlistActionState {}
