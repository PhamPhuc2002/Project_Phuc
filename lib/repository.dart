import 'dart:convert';

import 'package:flutter/services.dart';

import 'catalog/models/item.dart';

class Repository {
  Future<List<dynamic>> readData() async {
    var jsonText = await rootBundle.loadString('data/product.json');
    var data = json.decode(jsonText);
    var key = data['product'];
    return key;
  }

  Future<List<Item>> getProduct() async {
    List<Item> list = [];
    List<dynamic> data = await readData();
    try {
      list = data.map((e) => Item.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }
    return list;
  }
//-----------------------------------------------------------------------------

  Future<List<Item>> loadItem() async {
    return Future.delayed(
      const Duration(seconds: 1),
      () => itemList,
    );
  }

//-------------------------------------------------------------------------------
  final itemList = <Item>[];

  void addItem(Item items) => itemList.add(items);

  void removeItem(Item items) => itemList.remove(items);
}
