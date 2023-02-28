import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart_cubit/cart/cubit/cart_cubit.dart';
import 'package:shopping_cart_cubit/catalog/cubit/catalog_cubit.dart';
import 'package:shopping_cart_cubit/catalog/models/item.dart';
import 'package:shopping_cart_cubit/home.dart';
import 'package:shopping_cart_cubit/repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo App',
      theme: ThemeData.dark(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CatalogCubit>(
            create: (context) => CatalogCubit(repository: Repository()),
          ),
          BlocProvider<CartCubit>(
            create: (context) => CartCubit(repository: Repository()),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
