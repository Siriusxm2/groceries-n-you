import 'package:get/get.dart';

import '../models/admin_product_model.dart';

class ProductController extends GetxController {
  List<ProductModelAdmin> products = ProductModelAdmin.products.obs;

  var newProduct = {}.obs;

  get price => newProduct['price'];
  get isSale => newProduct['is_sale'];
  get saleAmount => newProduct['sale_amount'];
  get inStorage => newProduct['in_storage'];

  void updateProductPrice(
    int index,
    ProductModelAdmin product,
    double value,
  ) {
    product.price = value;
    products[index] = product;
  }

  void updateProductIsSale(
    int index,
    ProductModelAdmin product,
    bool value,
  ) {
    product.isOnSale = value;
    products[index] = product;
  }

  void updateProductSaleAmount(
    int index,
    ProductModelAdmin product,
    int value,
  ) {
    product.saleAmount = value;
    products[index] = product;
  }

  void updateProductInStorage(
    int index,
    ProductModelAdmin product,
    int value,
  ) {
    product.inStorage = value;
    products[index] = product;
  }
}
