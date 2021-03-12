// import 'package:ecommerce/components/CatalogueCard.dart';
// import 'package:ecommerce/components/CustomScaffold.dart';
// import 'package:ecommerce/models/CatalogueTypes.dart';
// import 'package:flutter/material.dart';

// class CategoryList extends StatelessWidget {
//   const CategoryList({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//           children: catalogueTypes
//               .where((c) => getSearchFunction(context)(c.name))
//               .map<Widget>(
//                 (c) => GestureDetector(onTap: , child: CatalogueCard(catalogueType: c)),
//               )
//               .toList(),
//       );
//   }
// }