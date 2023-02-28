import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shopping_cart_cubit/cart/models/cart.dart';
import 'package:shopping_cart_cubit/catalog/cubit/catalog_cubit.dart';
import 'package:shopping_cart_cubit/catalog/models/item.dart';
import 'package:shopping_cart_cubit/repository.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.repository}) : super(LoadingCart()) {
    loadingItem();
  }

  final Repository repository;

  loadingItem() async {
    emit(LoadingCart());
    print('On Loading Cart');
    try {
      final item = await repository.loadItem();
      emit(LoadedCartState(cart: Cart(item: [...item])));
      print('Load Cart Sucess!');
    } catch (e) {
      emit(ErrorLoading());
      print('Error loading');
    }
  }

  Future<void> addedItem(Item items) async {
    final state = this.state;
    if (state is LoadedCartState) {
      try {
        repository.addItem(items);
        emit(
          LoadedCartState(
            cart: Cart(item: [...state.cart.item, items]),
          ),
        );
        print('Add Item Sucess');
      } catch (e) {
        emit(ErrorLoading());
        print('Add item error!');
        print(e);
      }
    }
  }

  Future<void> removeItem(Item items) async {
    final state = this.state;
    if (state is LoadedCartState) {
      try {
        repository.removeItem(items);
        emit(
          LoadedCartState(
            cart: Cart(item: [...state.cart.item]..remove(items)),
          ),
        );
        print('Remove Item Sucess');
      } catch (e) {
        emit(ErrorLoading());
        print('Remove item error!');
        print(e);
      }
    }
  }
}
