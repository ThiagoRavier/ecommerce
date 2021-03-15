part of 'filter_bloc.dart';

class FilterState {
  List<String> sizes;
  List<ProductColor> colors;
  List<String> brands;
  double minValue;
  double maxValue;
  ProductOrder order;
  ProductCategory category;

  FilterState({
    List<String> sizes,
    List<ProductColor> colors,
    List<String> brands,
    this.minValue,
    this.maxValue,
    this.category,
    ProductOrder order,
  })  : this.order = order ?? productOrders.first,
        this.colors = colors ?? [],
        this.brands = brands ?? [],
        this.sizes = sizes ?? [];
}
