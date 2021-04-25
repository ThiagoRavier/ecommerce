import 'package:ecommerce/components/CustomScaffold/CustomScaffold.dart';
import 'package:ecommerce/components/ExpansibleTextCard.dart';
import 'package:ecommerce/models/CartProduct.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/screens/ProductPage/components/AddToCartBottom.dart';
import 'package:ecommerce/screens/ProductPage/components/MainCard.dart';
import 'package:ecommerce/screens/ProductPage/components/RelatedGalery.dart';
import 'package:ecommerce/screens/ProductPage/components/ReviewCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/product_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;
    return BlocProvider(
      create: (context) => ProductCubit(
        cartProduct: CartProduct(product: product),
      ),
      child: CustomScaffold(
        appBar: SizedBox(),
        body: Column(
          children: [
            MainCard(
              product: product,
              reviewNumber: 10,
              isInStock: false,
            ),
            ExpansibleTextCard(
              title: 'Detalhes do Produto',
              text: product.description,
            ),
            ReviewCard(),
            SizedBox(height: 24),
            RelatedGallery(),
            SizedBox(height: 24),
          ],
        ),
        bottomNavigationBar: AddToCartBottom(),
      ),
    );
  }
}
