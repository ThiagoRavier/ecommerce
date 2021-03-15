import 'package:ecommerce/components/SectionTitle.dart';
import 'package:ecommerce/models/ProductOrder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/models/Product.dart';

import 'ProductGrid.dart';

class SortableProductGrid extends StatefulWidget {
  final List<Product> products;

  const SortableProductGrid({Key key, this.products}) : super(key: key);

  @override
  _SortableProductGridState createState() => _SortableProductGridState();
}

class _SortableProductGridState extends State<SortableProductGrid> {
  ProductOrder productOrder = productOrders[0];

  @override
  Widget build(BuildContext context) {
    widget.products.sort((a, b) => a
        .get(productOrder.comparisonField)
        .compareTo(b.get(productOrder.comparisonField)));
    List<Product> sortedProducts = productOrder.descending
        ? widget.products.reversed.toList()
        : widget.products;
    return Column(
      children: [
        SectionTitle(
          title: '${sortedProducts.length} itens',
          rightCornerWidget: Row(
            children: [
              Text('Ordenar por: ',
                  style: Theme.of(context).textTheme.headline4),
              Container(
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: false,
                    child: DropdownButton(
                      value: productOrder,
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 4, left: 4),
                        child: Icon(CupertinoIcons.chevron_down, size: 12),
                      ),
                      items: productOrders
                          .map<DropdownMenuItem>(
                            (o) => DropdownMenuItem(
                              child: Text(
                                o.label,
                                style: TextStyle(fontSize: 12, height: 16 / 12),
                              ),
                              value: o,
                            ),
                          )
                          .toList(),
                      onChanged: (value) =>
                          setState(() => productOrder = value),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ProductGrid(
          products: sortedProducts,
        ),
      ],
    );
  }
}
