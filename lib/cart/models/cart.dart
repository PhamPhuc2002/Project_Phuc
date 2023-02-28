import 'package:equatable/equatable.dart';

import '../../catalog/models/item.dart';

class Cart extends Equatable {
  const Cart({this.item = const <Item>[]});
  final List<Item> item;
  @override
  List<Object?> get props => [item];
}
