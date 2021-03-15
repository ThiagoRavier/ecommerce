import 'package:ecommerce/models/ProductColor.dart';
import 'package:ecommerce/models/ProductOrder.dart';
import 'package:ecommerce/models/ProductCategory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState());

  void change({
    double minValue,
    double maxValue,
    ProductOrder order,
    ProductCategory category,
    String size,
    ProductColor color,
    String brand,
  }) {
    if (minValue != null) state.minValue = minValue;
    if (maxValue != null) state.maxValue = maxValue;
    if (order != null) state.order = order;
    if (category != null) state.category = category;
    if (size != null) toggleValue(state.sizes, size);
    if (color != null) toggleValue(state.colors, color);
    if (brand != null) toggleValue(state.brands, brand);
    emit(FilterState(
      sizes: state.sizes,
      minValue: state.minValue,
      maxValue: state.maxValue,
      order: state.order,
      colors: state.colors,
      brands: state.brands,
      category: state.category,
    ));
  }
}

void toggleValue(List list, value) {
  if (list.contains(value))
    list.remove(value);
  else
    list.add(value);
}
