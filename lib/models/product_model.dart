class ProductModel {
  final int? id;
  final String? name;
  final String? manu;
  final String? picture;
  final num? price;
  final bool? isOnSale;
  final int? saleAmount;

  const ProductModel({
    this.id,
    this.name,
    this.manu,
    this.picture,
    this.price,
    this.isOnSale,
    this.saleAmount,
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
}
