// import 'package:ecommerce/bloc/filter/filter_bloc.dart';

import 'package:ecommerce/models/ProductCategory.dart';

class MarketingCampaign {
  final String image;
  final String bigText;
  final String smallText;
  // final FilterState filter;

  MarketingCampaign({
    this.image,
    this.bigText,
    this.smallText,
    // this.filter,
  });
}

List<MarketingCampaign> campaigns = productCategories
    .map((c) => MarketingCampaign(
        image: c.image, bigText: c.name, smallText: c.subcategories.join(', ')))
    .toList();
