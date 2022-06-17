import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProductModelAdmin extends Equatable {
  final int id;
  final String name;
  final String manu;
  final String picture;
  double price;
  bool isOnSale;
  int saleAmount;
  int inStorage;

  ProductModelAdmin({
    required this.id,
    required this.name,
    required this.manu,
    required this.picture,
    this.price = 0,
    this.isOnSale = false,
    this.saleAmount = 0,
    this.inStorage = 0,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      manu,
      picture,
      price,
      isOnSale,
      saleAmount,
      inStorage,
    ];
  }

  ProductModelAdmin copyWith({
    int? id,
    String? name,
    String? manu,
    String? picture,
    double? price,
    bool? isOnSale,
    int? saleAmount,
    int? inStorage,
  }) {
    return ProductModelAdmin(
      id: id ?? this.id,
      name: name ?? this.name,
      manu: manu ?? this.manu,
      picture: picture ?? this.picture,
      price: price ?? this.price,
      isOnSale: isOnSale ?? this.isOnSale,
      saleAmount: saleAmount ?? this.saleAmount,
      inStorage: inStorage ?? this.inStorage,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'manu': manu});
    result.addAll({'picture': picture});
    result.addAll({'price': price});
    result.addAll({'isOnSale': isOnSale});
    result.addAll({'saleAmount': saleAmount});
    result.addAll({'inStorage': inStorage});

    return result;
  }

  factory ProductModelAdmin.fromMap(Map<String, dynamic> map) {
    return ProductModelAdmin(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      manu: map['manu'] ?? '',
      picture: map['picture'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      isOnSale: map['isOnSale'] ?? false,
      saleAmount: map['saleAmount']?.toInt() ?? 0,
      inStorage: map['inStorage']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModelAdmin.fromJson(String source) =>
      ProductModelAdmin.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModelAdmin(id: $id, name: $name, manu: $manu, picture: $picture, price: $price, isOnSale: $isOnSale, saleAmount: $saleAmount, inStorage: $inStorage)';
  }

  static List<ProductModelAdmin> products = [
    ProductModelAdmin(
      id: 1,
      name: 'Amstel Premium Pilsener - 0,5 Л кен',
      manu: 'Amstel',
      picture: 'assets/products/beers/Amstel_Can.png',
      price: 1.28,
      isOnSale: true,
      saleAmount: 33,
      inStorage: 10,
    ),
    ProductModelAdmin(
      id: 2,
      name: 'Amstel Premium Pilsener - 0,5 Л стъкло',
      manu: 'Amstel',
      picture: 'assets/products/beers/Amstel_Glass.png',
      price: 1.4,
      isOnSale: false,
      saleAmount: 0,
      inStorage: 10,
    ),
    ProductModelAdmin(
      id: 3,
      name: 'Ариана светло пиво - 0,5Л кен',
      manu: 'Ariana',
      picture: 'assets/products/beers/Ariana_Can.png',
      price: 0.9,
      isOnSale: false,
      saleAmount: 0,
      inStorage: 10,
    ),
    ProductModelAdmin(
      id: 4,
      name: 'Ариана светло пиво - 0,5Л стъкло',
      manu: 'Ariana',
      picture: 'assets/products/beers/Ariana_Glass.png',
      price: 1.08,
      isOnSale: true,
      saleAmount: 20,
      inStorage: 10,
    ),
    ProductModelAdmin(
      id: 5,
      name: 'Heineken светло пиво - 0,5Л кен',
      manu: 'Heineken',
      picture: 'assets/products/beers/Heineken_Can.png',
      price: 0.89,
      isOnSale: false,
      saleAmount: 0,
      inStorage: 10,
    ),
  ];
}
