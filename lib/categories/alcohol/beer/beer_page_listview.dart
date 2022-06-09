import 'package:flutter/material.dart';
import 'package:groceries_n_you/categories/alcohol/beer/beer_count.dart';
import 'package:groceries_n_you/dimensions.dart';

class BeerPageListView extends StatelessWidget {
  const BeerPageListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: Dimensions.height10),
        width: MediaQuery.of(context).size.width - Dimensions.width20,
        child: Column(
          children: productList,
        ),
      ),
    );
  }
}
