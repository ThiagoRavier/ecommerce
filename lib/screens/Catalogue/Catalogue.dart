import 'package:flutter/material.dart';
import 'package:ecommerce/components/TagList.dart';

class Catalogue extends StatefulWidget {
  // Catalogue({Key key}) : super(key: key);

  @override
  _CatalogueState createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  bool sizeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TagList(
          labels: ['Todos', 'Vestidos', 'Calças', 'Blusas'],
        ),
      ],
    );
  }
}
