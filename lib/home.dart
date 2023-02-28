import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_cubit/cart/view/cart_page.dart';
import 'package:shopping_cart_cubit/catalog/view/catalog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> list = [
    const CatalogScreen(),
    const CartScreen(),
  ];
  int currenIndex = 0;
  void _ontapSelected(int index) {
    setState(() {
      currenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _ontapSelected,
        currentIndex: currenIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}
