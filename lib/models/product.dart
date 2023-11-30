import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String productName;
  final String price;
  final String image;

  const Product(
      {required this.id,
      required this.productName,
      required this.price,
      required this.image});

  @override
  List<Object?> get props => [id, productName, price, image];
}
