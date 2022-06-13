import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String name;
  final String manu;
  final String picture;
  final num price;
  final bool isOnSale;
  final int saleAmount;

  const ProductModel({
    this.id = -1,
    this.name = '',
    this.manu = '',
    this.picture = '',
    this.price = -1,
    this.isOnSale = false,
    this.saleAmount = -1,
  });

  static List<ProductModel> products = [];

  dynamic setProducts(
    int id,
    String name,
    String manu,
    String pic,
    num price,
    bool sale,
    int saleAmount,
  ) {
    return ProductModel(
      id: id,
      name: name,
      manu: manu,
      picture: pic,
      price: price,
      isOnSale: sale,
      saleAmount: saleAmount,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        manu,
        picture,
        price,
        isOnSale,
        saleAmount,
      ];
}
