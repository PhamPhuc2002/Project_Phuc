import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart_cubit/cart/cubit/cart_cubit.dart';
import 'package:shopping_cart_cubit/catalog/models/item.dart';

import '../cubit/catalog_cubit.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart With Cubit'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: const [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ProductList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogCubit, CatalogState>(
      builder: (context, state) {
        if (state is LoadingCatalog) {
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
        if (state is LoadedCatalog) {
          var info = state.itemList;
          List<Item> list = [];
          list = info;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final items = state.itemList[index];
              return Card(
                color: Colors.grey.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  title: Text(list[index].productName),
                  subtitle: Text('${list[index].price} VND'),
                  trailing: IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Added Product To Cart'),
                          duration: const Duration(milliseconds: 800),
                          backgroundColor: Colors.grey.withOpacity(0.7),
                        ),
                      );
                      context.read<CartCubit>().addedItem(items);
                    },
                    icon: const Icon(Icons.add_box_rounded),
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
