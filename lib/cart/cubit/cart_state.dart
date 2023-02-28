part of 'cart_cubit.dart';

@immutable
abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingCart extends CartState {}

class LoadedCartState extends CartState {
  LoadedCartState({this.cart = const Cart()});
  final Cart cart;
  //final Item items;

  @override
  List<Object?> get props => [cart];
}

class ErrorLoading extends CartState {}
