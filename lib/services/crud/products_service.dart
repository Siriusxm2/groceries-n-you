import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'crud_exceptions.dart';

class ProductsService {
  Database? _db;

  // SINGLETON
  static final ProductsService _shared = ProductsService._sharedInstance();
  ProductsService._sharedInstance();
  factory ProductsService() => _shared;
  //SINGLETON

  // PRODUCT ACTIONS
  Future<DatabaseProduct> getProduct({required String name}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final results = await db.query(
      productTable,
      columns: [
        idColumn,
      ],
      limit: 1,
      where: 'product_name = ?',
      whereArgs: [name.toLowerCase()],
    );
    if (results.isEmpty) {
      throw CouldNotFindProductException();
    } else {
      return DatabaseProduct.fromRow(results.first);
    }
  }

  // DB Actions

  Database _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpenException();
    } else {
      return db;
    }
  }

  Future<void> _ensureDbIsOpen() async {
    try {
      await open();
    } on DatabaseAlreadyOpenedException {
      // empty
    }
  }

  Future<void> open() async {
    final docsPath = await getApplicationDocumentsDirectory();
    final dbPath = join(docsPath.path, dbName);

    // If DB already open
    if (_db != null) {
      throw DatabaseAlreadyOpenedException();
    }
    // Open DB
    try {
      final db = await openDatabase(dbPath, readOnly: true);
      _db = db;
    } on MissingPlatformDirectoryException {
      throw UnableToGetDocumentsDirectoryException();
    }
  }

  Future<void> close() async {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpenException();
    } else {
      await db.close();
      _db = null;
    }
  }
}

@immutable
class DatabaseProduct {
  final int id;
  final String productName;
  final String productManufacturer;
  final String productPicture;
  final num productPrice;

  const DatabaseProduct({
    required this.id,
    required this.productName,
    required this.productManufacturer,
    required this.productPicture,
    required this.productPrice,
  });

  DatabaseProduct.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as int,
        productName = map[productNameColumn] as String,
        productManufacturer = map[productManufacturerColumn] as String,
        productPicture = map[productPictureColumn] as String,
        productPrice = map[productPriceColumn] as num;

  @override
  String toString() =>
      'Product: ID = $id, Name = $productName, Manufacturer = $productManufacturer, Picture = $productPicture, Price = $productPrice';

  @override
  bool operator ==(covariant DatabaseProduct other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

const dbName = 'products.db';
const productTable = 'products';
const idColumn = 'id';
const productNameColumn = 'product_name';
const productManufacturerColumn = 'product_manufacturer';
const productPictureColumn = 'product_picture';
const productPriceColumn = 'product_price';
