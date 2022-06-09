import 'package:flutter/material.dart';
import 'package:groceries_n_you/categories/alcohol/beer/beer_count.dart';
import 'package:groceries_n_you/dimensions.dart';

import '../../../services/crud/orders_service.dart';

class BeerPageTileView extends StatelessWidget {
  const BeerPageTileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.height10),
      width: MediaQuery.of(context).size.width - Dimensions.width20,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: productList,
      ),
    );
  }
}
