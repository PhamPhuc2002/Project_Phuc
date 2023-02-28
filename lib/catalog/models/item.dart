import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final int id;
  final String productName;
  final int price;
  final String description;
  const Item({
    required this.id,
    required this.productName,
    required this.price,
    required this.description,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      productName: json['productName'],
      price: json['price'],
      description: json['description'],
    );
  }

  @override
  List<Object?> get props => [id, productName, price, description];
}
