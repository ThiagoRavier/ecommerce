import 'package:ecommerce/bloc/filter/filter_bloc.dart';
import 'package:ecommerce/components/CustomScaffold/CustomScaffold.dart';
import 'package:ecommerce/components/GoldButton.dart';
import 'package:ecommerce/models/ProductColor.dart';
import 'package:ecommerce/models/ProductOrder.dart';
import 'package:ecommerce/screens/Filter/components/ColorSelector.dart';
import 'package:ecommerce/screens/Filter/components/ComboboxWithTitle.dart';
import 'package:ecommerce/screens/Filter/components/PriceRange.dart';
import 'package:ecommerce/screens/Filter/components/SelectableListOfTiles.dart';
import 'package:ecommerce/screens/Filter/components/SmallSectionTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes.dart';
import 'components/SizeSelector.dart';

class FilterScreen extends StatefulWidget {
  final brandOptions = ['Lacoste', 'Louis Vitton'];
  final orderOptions = productOrders.map<String>((o) => o.label).toList();

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    var filter = context.read<FilterCubit>();
    return CustomScaffold(
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.headline3,
        child: BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallSectionTitle(title: 'Preços'),
                  PriceRange(
                    start: filter.state.minValue,
                    end: filter.state.maxValue,
                    onChanged: (values) => filter.change(
                        minValue: values.start, maxValue: values.end),
                  ),
                  ComboBoxWithTitle(
                    title: 'Categorias',
                    options: ['Vestidos', 'Blusas'],
                    selectedIndex: 0,
                    // onChanged: filter.change,
                  ),
                  ComboBoxWithTitle(
                    title: 'Marcas',
                    options: widget.brandOptions,
                    onChanged: (String brand) => filter.change(brand: brand),
                    selectedIndex: state.brands.isNotEmpty
                        ? widget.brandOptions.indexOf(state.brands.first)
                        : 0,
                  ),
                  SelectableListOfTiles<ProductColor>(
                    builderFunction: colorButtonBuilder,
                    selectedIndexes:
                        state.colors.map((c) => colors.indexOf(c)).toList(),
                    title: 'Cores',
                    options: colors,
                  ),
                  SelectableListOfTiles<String>(
                    builderFunction: sizeButtonBuilder,
                    selectedIndexes:
                        state.sizes.map((s) => sizes.indexOf(s)).toList(),
                    title: 'Tamanhos',
                    options: sizes,
                  ),
                  ComboBoxWithTitle(
                    title: 'Ordenar por',
                    options: widget.orderOptions,
                    selectedIndex:
                        widget.orderOptions.indexOf(state.order.label),
                    onChanged: (String order) => filter.change(
                        order:
                            productOrders[widget.orderOptions.indexOf(order)]),
                  ),
                  GoldButton(
                    label: 'Aplicar Filtros',
                    onPressed: () {},
                    padding: const EdgeInsets.all(16.0),
                  ),
                ]);
          },
        ),
      ),
      appBarInfo: BottomBarInfo(
        hasSearch: false,
        label: 'Filtros',
        rightCornerWidget:
            GestureDetector(onTap: () {}, child: Icon(Icons.clear)),
      ),
      bottomNavigationBar: SizedBox(),
    );
  }
}
