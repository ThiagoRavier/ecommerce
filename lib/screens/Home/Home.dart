import 'package:ecommerce/components/CustomScaffold/CustomScaffold.dart';
import 'package:ecommerce/components/ProductGrid.dart';
import 'package:ecommerce/components/SmallTextWithArrow.dart';
import 'package:ecommerce/models/MarketingCampaign.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/models/ProductCategory.dart';
import 'package:ecommerce/components/SectionTitle.dart';
import 'package:ecommerce/screens/Home/components/MarketingFrame.dart';
import 'package:ecommerce/sizeConfig.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';
import 'components/CatalogueTile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CustomScaffold(
      body: Column(
        children: [
          MarketingFrame(
            marketingCampaigns: campaigns,
          ),
          VerticalSpacing(of: 10),
          SectionTitle(
            title: "Catálago",
            rightCornerWidget: SmallTextWithArrow(
              text: 'Ver Tudo',
              onTap: () => Navigator.pushNamed(context, '/catalogue'),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 16),
                ...productCategories
                    .map((c) => Padding(
                          padding: EdgeInsets.only(
                              right: getProportionateScreenWidth(16)),
                          child: CatalogueTile(
                            label: c.name,
                            image: c.image,
                            onTap: () {},
                          ),
                        ))
                    .toList(),
              ],
            ),
          ),
          SizedBox(height: 24),
          SectionTitle(title: 'Em Destaque'),
          SizedBox(height: 16),
          ProductGrid(
            products: products.where((p) => p.isFeatured).toList(),
          )
        ],
      ),
      appBarInfo: BottomBarInfo(
        label: 'Home',
        leftCornerWidget: GestureDetector(
          onTap: () {},
          child: Icon(Icons.menu_rounded),
        ),
        rightCornerWidget: Icon(Icons.notifications_none_outlined),
      ),
    );
  }
}
