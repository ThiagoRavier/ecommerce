import 'package:ecommerce/models/ProductColor.dart';
import 'package:equatable/equatable.dart';
import 'Product.dart';

class CartProduct extends Equatable {
  final Product product;
  final ProductColor color;
  final String size;

  CartProduct({
    this.product,
    this.color,
    this.size,
  });

  @override
  List<Object> get props => [product, color, size];
}
