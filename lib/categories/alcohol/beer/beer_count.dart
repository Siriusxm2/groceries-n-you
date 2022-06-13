import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import '../../../myWidgets/my_product.dart';

class Products {
  var prods = ProductModel.products;

  List<Widget> convertToView(bool view) {
    List<Widget> productList = [];
    for (int i = 0; i < prods.length; i++) {
      productList.add(MyProductWidget(
        product: prods[i],
        view: view,
      ));
    }
    return productList;
  }
}
