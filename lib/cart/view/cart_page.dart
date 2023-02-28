import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart_cubit/cart/cubit/cart_cubit.dart';

import '../../catalog/cubit/catalog_cubit.dart';
import '../../catalog/models/item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: const [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ItemAddList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemAddList extends StatelessWidget {
  const ItemAddList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is LoadingCart) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: CircularProgressIndicator(),
              ),
              Text('Loading data...'),
            ],
          );
        }
        if (state is LoadedCartState) {
          return ListView.separated(
            itemCount: state.cart.item.length,
            separatorBuilder: (_, __) => const SizedBox(
              height: 20,
            ),
            itemBuilder: (context, index) {
              final items = state.cart.item[index];
              return Material(
                color: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior: Clip.hardEdge,
                child: ListTile(
                  title: Text(items.productName),
                  subtitle: Text('${items.price}'),
                  trailing: IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Delete Product From Cart'),
                          duration: const Duration(milliseconds: 800),
                          backgroundColor: Colors.grey.withOpacity(0.7),
                        ),
                      );
                      context.read<CartCubit>().removeItem(items);
                    },
                    icon: const Icon(Icons.remove_circle),
                  ),
                ),
              );
            },
          );
        }
        if (state is ErrorLoadingCatalog) {
          return const Center(
            child: Text('Error Loaing Data!!'),
          );
        }
        return Container();
      },
    );
  }
}
