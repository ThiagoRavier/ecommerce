class ProductOrder {
  String comparisonField;
  String label;
  bool descending;

  ProductOrder(this.comparisonField, this.label, {this.descending = true});
}

List<ProductOrder> productOrders = [
  ProductOrder('rating', 'Avaliação'),
  ProductOrder('priceWithDiscount', 'Preço: menor para o maior',
      descending: false),
  ProductOrder('priceWithDiscount', 'Preço: maior para o menor'),
  ProductOrder('discountRate', 'Desconto'),
  ProductOrder('name', 'A-Z', descending: false),
  ProductOrder('name', 'Z-A'),
];
