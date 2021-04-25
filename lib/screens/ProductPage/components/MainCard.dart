import 'package:ecommerce/components/CustomCard.dart';
import 'package:ecommerce/components/PriceWithDiscount.dart';
import 'package:ecommerce/components/ProductFrame/StarRatings.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/models/ProductColor.dart';
import 'package:ecommerce/screens/Filter/components/SelectableListOfTiles.dart';
import 'package:ecommerce/screens/Filter/components/SizeSelector.dart';
import 'package:ecommerce/screens/ProductPage/blocs/product_bloc.dart';
import 'package:ecommerce/screens/ProductPage/components/InStock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ProductColorTile.dart';
import 'ProductPhotoGallery.dart';

class MainCard extends StatefulWidget {
  const MainCard({
    Key key,
    @required this.product,
    @required this.isInStock,
    this.reviewNumber = 0,
    this.availableSizes,
  }) : super(key: key);

  final Product product;
  final bool isInStock;
  final int reviewNumber;
  final List<String> availableSizes;

  @override
  _MainCardState createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    var radius = Radius.circular(8);
    var availableColors = widget.product.availableColors.keys.toList();
    List<int> getSelectedColorIndexes(ProductColor color) =>
        (color != null ? [availableColors.indexOf(color)] : []);
    List<int> getSelectedSizeIndexes(String size) =>
        (size != null ? [sizes.indexOf(size)] : []);
    return CustomCard(
      borderRadius: BorderRadius.only(bottomLeft: radius, bottomRight: radius),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return Column(children: [
            ProductPhotoGallery(photos: widget.product.images),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(decoration: TextDecoration.none),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              StarRatings(rating: widget.product.rating),
                              SizedBox(width: 4),
                              Text('${widget.reviewNumber} avaliações'),
                            ],
                          ),
                          InStock(isInStock: widget.isInStock)
                        ]),
                  ),
                  SizedBox(height: 14),
                  Text(widget.product.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontWeight: FontWeight.normal)),
                  SizedBox(height: 12),
                  PriceWithDiscount(
                    price: widget.product.price,
                    discountRate: widget.product.discountRate,
                    fontSizeRate: 25 / 17,
                  ),
                ],
              ),
            ),
            SelectableListOfTiles<ProductColor>(
              builderFunction: productColorButtonBuilder(widget.product),
              selectedIndexes: getSelectedColorIndexes(state.cartProduct.color),
              enabledIndexes: [],
              title: 'Cores',
              options: availableColors,
              onTap: (ProductColor color) =>
                  context.read<ProductCubit>().change(color: color),
              topPadding: 8,
            ),
            SelectableListOfTiles<String>(
              builderFunction: sizeButtonBuilder,
              selectedIndexes: getSelectedSizeIndexes(state.cartProduct.size),
              enabledIndexes: [],
              title: 'Tamanhos',
              options: sizes,
              onTap: (String size) =>
                  context.read<ProductCubit>().change(size: size),
            ),
            SizedBox(height: 24),
          ]);
        },
      ),
    );
  }
}
