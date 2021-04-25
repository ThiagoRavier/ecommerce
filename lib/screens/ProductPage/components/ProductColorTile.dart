import 'package:ecommerce/components/PhotoBox.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/models/ProductColor.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

Builder Function(
    ProductColor, bool, void Function(ProductColor)) productColorButtonBuilder(
        Product product) =>
    (ProductColor color, bool selected, void Function(ProductColor) onTap) =>
        Builder(builder: (BuildContext context) {
          return GestureDetector(
            onTap: () => onTap(color),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: defaultRadius,
                  border: Border.all(
                      color: selected
                          ? Theme.of(context).buttonColor
                          : Theme.of(context).dividerColor)),
              width: 47,
              child: AspectRatio(
                aspectRatio: 1,
                child: PhotoBox(
                  image: product.availableColors[color],
                  borderRadius: defaultRadius,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          );
        });

getProportionateScreenWidth(int i) {}
