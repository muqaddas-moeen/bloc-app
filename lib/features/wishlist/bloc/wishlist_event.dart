part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

final class WishlistInitialEvent extends WishlistEvent {}

class WishlistItemDeleteButtonClickedEvent extends WishlistEvent {
  final ProductDataModel clickedProduct;
  WishlistItemDeleteButtonClickedEvent({required this.clickedProduct});
}
