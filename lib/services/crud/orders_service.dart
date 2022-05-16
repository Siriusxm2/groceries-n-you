import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'crud_exceptions.dart';
import 'package:intl/intl.dart';

class OrdersService {
  Database? _db;
  List<DatabaseOrder> _orders = [];

  // SINGLETON
  static final OrdersService _shared = OrdersService._sharedInstance();
  OrdersService._sharedInstance();
  factory OrdersService() => _shared;
  // SINGLETON END

  final _ordersStreamController =
      StreamController<List<DatabaseOrder>>.broadcast();

  Stream<List<DatabaseOrder>> get allOrders => _ordersStreamController.stream;

  Future<void> _cacheOrders() async {
    final allOrders = await getAllOrders();
    _orders = allOrders.toList();
    _ordersStreamController.add(_orders);
  }

  Future<DatabaseUser> createUser({required String email}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final results = await db.query(
      userTable,
      limit: 1,
      where: 'email = ?',
      whereArgs: [email.toLowerCase()],
    );
    if (results.isNotEmpty) {
      throw UserAlreadyExistsException();
    }

    final userId = await db.insert(userTable, {
      emailColumn: email.toLowerCase(),
    });

    return DatabaseUser(id: userId, email: email);
  }

  Future<DatabaseUser> getUser({required String email}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final results = await db.query(
      userTable,
      limit: 1,
      where: 'email = ?',
      whereArgs: [email.toLowerCase()],
    );
    if (results.isEmpty) {
      throw CouldNotFindUserException();
    } else {
      return DatabaseUser.fromRow(results.first);
    }
  }

  Future<DatabaseUser> getOrCreateUser({required String email}) async {
    try {
      final user = await getUser(email: email);
      return user;
    } on CouldNotFindUserException {
      final createdUser = await createUser(email: email);
      return createdUser;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUser({required String email}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final deletedCount = await db.delete(
      userTable,
      where: 'email = ?',
      whereArgs: [email.toLowerCase()],
    );
    if (deletedCount != 1) throw CouldNotDeleteUserException();
  }

  Future<DatabaseOrder> createOrder({
    required DatabaseUser owner,
    required DatabaseProduct product,
  }) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final dbUser = await getUser(email: owner.email);
    final dbProduct = await getProduct(name: product.productName);

    // Make sure owner exists in database with correct id
    if (dbUser != owner) {
      throw CouldNotFindUserException();
    }

    if (dbProduct != product) {
      throw CouldNotFindProductException();
    }

    const orderPrice = 0.0;
    const orderDate = '';

    // Create the note
    final orderId = await db.insert(orderTable, {
      userIdColumn: owner.id,
      productIdColumn: product.id,
      orderPriceColumn: orderPrice,
      orderDateColumn: orderDate,
      isSyncedWithCloudColumn: 1,
    });

    final order = DatabaseOrder(
      id: orderId,
      userId: owner.id,
      productId: product.id,
      orderPrice: orderPrice,
      orderDate: orderDate,
      isSyncedWithCloud: true,
    );

    _orders.add(order);
    _ordersStreamController.add(_orders);

    return order;
  }

  Future<DatabaseOrder> getOrder({required int id}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final orders = await db.query(
      orderTable,
      limit: 1,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (orders.isEmpty) {
      throw CouldNotFindOrderException();
    } else {
      final order = DatabaseOrder.fromRow(orders.first);
      _orders.removeWhere((order) => order.id == id);
      _orders.add(order);
      _ordersStreamController.add(_orders);

      return order;
    }
  }

  Future<Iterable<DatabaseOrder>> getAllOrders() async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final orders = await db.query(orderTable);

    final result = orders.map((n) => DatabaseOrder.fromRow(orders.first));
    return result;
  }

  // Future<DatabaseOrder> updateOrder({
  //   required DatabaseOrder order,
  //   required String name,
  // }) async {
  //   await _ensureDbIsOpen();
  //   final db = _getDatabaseOrThrow();

  //   await getOrder(id: order.id);
  //   final updatesCount = await db.update(orderTable, {
  //     orderNameColumn: name,
  //     isSyncedWithCloudColumn: 0,
  //   });

  //   if (updatesCount == 0) {
  //     throw CouldNotUpdateOrderException();
  //   } else {
  //     final updatedOrder = await getOrder(id: order.id);
  //     _orders.removeWhere((order) => order.id == updatedOrder.id);
  //     _orders.add(updatedOrder);
  //     _ordersStreamController.add(_orders);
  //     return updatedOrder;
  //   }
  // }

  Future<void> deleteOrder({required int id}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final deletedCount = await db.delete(
      orderTable,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (deletedCount == 0) {
      throw CouldNotDeleteOrderException();
    } else {
      _orders.removeWhere((order) => order.id == id);
      _ordersStreamController.add(_orders);
    }
  }

  Future<int> deleteAllOrders() async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final numOfDeletions = await db.delete(orderTable);
    _orders = [];
    _ordersStreamController.add(_orders);

    return numOfDeletions;
  }

  Future<DatabaseProduct> getProduct({required String name}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final results = await db.query(
      productTable,
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
    if (_db != null) {
      throw DatabaseAlreadyOpenedException();
    }
    try {
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, dbName);
      final db = await openDatabase(dbPath);
      _db = db;
      // CREATE USER TABLE
      await db.execute(createUserTable);
      // CREATE ORDERS TABLE
      await db.execute(createOrdersTable);
      // CREATE PRODUCTS TABLE
      await db.execute(createProductsTable);

      await _cacheOrders();
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
class DatabaseUser {
  final int id;
  final String email;

  const DatabaseUser({
    required this.id,
    required this.email,
  });

  DatabaseUser.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as int,
        email = map[emailColumn] as String;

  @override
  String toString() => 'Person: ID = $id, email = $email';

  @override
  bool operator ==(covariant DatabaseUser other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

@immutable
class DatabaseOrder {
  final int id;
  final int userId;
  final int productId;
  final num orderPrice;
  final String orderDate;
  final bool isSyncedWithCloud;

  const DatabaseOrder({
    required this.id,
    required this.userId,
    required this.productId,
    required this.orderPrice,
    required this.orderDate,
    required this.isSyncedWithCloud,
  });

  DatabaseOrder.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as int,
        userId = map[userIdColumn] as int,
        productId = map[productIdColumn] as int,
        orderPrice = map[orderPriceColumn] as num,
        orderDate = map[orderDateColumn] as String,
        isSyncedWithCloud =
            (map[isSyncedWithCloudColumn] as int) == 1 ? true : false;

  @override
  String toString() =>
      'Sale: ID = $id, UserID = $userId, ProductID = $productId, Synced = $isSyncedWithCloud, OrderPrice = $orderPrice, OrderDate = $orderDate';

  @override
  bool operator ==(covariant DatabaseOrder other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
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

const dbName = 'orders.db';
const orderTable = 'orders';
const userTable = 'users';
const productTable = 'products';
const idColumn = 'id';
const emailColumn = 'email';
const userIdColumn = 'user_id';
const productIdColumn = 'product_id';
const orderPriceColumn = 'order_price';
const orderDateColumn = 'order_date';
const productNameColumn = 'product_name';
const productManufacturerColumn = 'product_manufacturer';
const productPictureColumn = 'product_picture';
const productPriceColumn = 'product_price';
const isSyncedWithCloudColumn = 'is_synced_with_cloud';
const createUserTable = '''
        CREATE TABLE IF NOT EXISTS "users" (
	      "id"	INTEGER NOT NULL,
	      "email"	TEXT NOT NULL UNIQUE,
	      PRIMARY KEY("id" AUTOINCREMENT)
        );''';
const createOrdersTable = ''' 
        CREATE TABLE IF NOT EXISTS "orders" (
	      "id"	INTEGER NOT NULL,
	      "user_id"	INTEGER NOT NULL,
	      "product_id"	INTEGER NOT NULL,
	      "order_price"	REAL NOT NULL,
	      "order_date"	TEXT NOT NULL,
	      "is_synced_with_cloud"	INTEGER NOT NULL DEFAULT 0,
	      PRIMARY KEY("id" AUTOINCREMENT),
        FOREIGN KEY("product_id") REFERENCES "products",
	      FOREIGN KEY("user_id") REFERENCES "users"("id")
        );''';
const createProductsTable = '''
        CREATE TABLE IF NOT EXISTS "products" (
	      "id"	INTEGER NOT NULL,
	      "product_name"	TEXT NOT NULL,
	      "product_manufacturer"	TEXT NOT NULL,
	      "product_picture"	TEXT NOT NULL,
	      "product_price"	REAL NOT NULL,
	      PRIMARY KEY("id" AUTOINCREMENT)
        );''';
