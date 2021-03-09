class Product {
  String name;
  double price;
  double discount;

  double getPriceWithDiscount() {
    return this.price * (1 - this.discount);
  }
}

String formattedPrice(double value) {
  return 'R\$ ' + value.toStringAsFixed(2).replaceAll('.', ',');
}
