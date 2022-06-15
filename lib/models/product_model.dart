import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String name;
  final String manu;
  final String picture;
  final double price;
  final bool isOnSale;
  final int saleAmount;

  const ProductModel({
    required this.name,
    required this.manu,
    required this.picture,
    required this.price,
    required this.isOnSale,
    required this.saleAmount,
  });

  static List<ProductModel> products = [];

  dynamic setProducts(
    String name,
    String manu,
    String pic,
    double price,
    bool sale,
    int saleAmount,
  ) {
    return ProductModel(
      name: name,
      manu: manu,
      picture: pic,
      price: price,
      isOnSale: sale,
      saleAmount: saleAmount,
    );
  }

  static ProductModel fromSnapshot(DocumentSnapshot snap) {
    ProductModel product = ProductModel(
      name: snap['product_name'],
      manu: snap['product_manufacturer'],
      picture: snap['product_image'],
      price: snap['product_price'],
      isOnSale: snap['is_sale'],
      saleAmount: snap['sale_amount'],
    );
    return product;
  }

  @override
  List<Object?> get props => [
        name,
        manu,
        picture,
        price,
        isOnSale,
        saleAmount,
      ];
}
