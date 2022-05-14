import 'package:flutter/foundation.dart';
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'crud_exceptions.dart';

class OrdersService {
  Database? _db;

  Future<DatabaseUser> createUser({required String email}) async {
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

  Future<void> deleteUser({required String email}) async {
    final db = _getDatabaseOrThrow();
    final deletedCount = await db.delete(
      userTable,
      where: 'email = ?',
      whereArgs: [email.toLowerCase()],
    );
    if (deletedCount != 1) throw CouldNotDeleteUserException();
  }

  Future<DatabaseOrder> createOrder({required DatabaseUser owner}) async {
    final db = _getDatabaseOrThrow();
    final dbUser = await getUser(email: owner.email);

    // Make sure owner exists in database with correct id
    if (dbUser != owner) {
      throw CouldNotFindUserException();
    }

    const orderName = '';
    const orderDate = '';

    // Create the note
    final orderId = await db.insert(orderTable, {
      userIdColumn: owner.id,
      orderNameColumn: orderName,
      orderDateColumn: orderDate,
      isSyncedWithCloudColumn: 1,
    });

    final order = DatabaseOrder(
      id: orderId,
      userId: owner.id,
      orderName: orderName,
      orderDate: orderDate,
      isSyncedWithCloud: true,
    );

    return order;
  }

  Future<DatabaseOrder> getOrder({required int id}) async {
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
      return DatabaseOrder.fromRow(orders.first);
    }
  }

  Future<Iterable<DatabaseOrder>> getAllOrder() async {
    final db = _getDatabaseOrThrow();
    final orders = await db.query(orderTable);

    final result = orders.map((n) => DatabaseOrder.fromRow(orders.first));
    return result;
  }

  Future<DatabaseOrder> updateNote({
    required DatabaseOrder order,
    required String name,
  }) async {
    final db = _getDatabaseOrThrow();

    await getOrder(id: order.id);
    final updatesCount = await db.update(orderTable, {
      orderNameColumn: name,
      isSyncedWithCloudColumn: 0,
    });

    if (updatesCount == 0) {
      throw CouldNotUpdateOrderException();
    } else {
      return await getOrder(id: order.id);
    }
  }

  Future<void> deleteOrder({required int id}) async {
    final db = _getDatabaseOrThrow();
    final deletedCount = await db.delete(
      orderTable,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (deletedCount == 0) throw CouldNotDeleteOrderException();
  }

  Future<int> deleteAllOrders() async {
    final db = _getDatabaseOrThrow();
    return await db.delete(orderTable);
  }

  Database _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpenException();
    } else {
      return db;
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
    } on MissingPlatformDirectoryException {
      throw UnableToGetDocumentsDirectoryException();
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
  final String orderName;
  final String orderDate;
  final bool isSyncedWithCloud;

  const DatabaseOrder({
    required this.id,
    required this.userId,
    required this.orderName,
    required this.orderDate,
    required this.isSyncedWithCloud,
  });

  DatabaseOrder.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as int,
        userId = map[userIdColumn] as int,
        orderName = map[orderNameColumn] as String,
        orderDate = map[orderDateColumn] as String,
        isSyncedWithCloud =
            (map[isSyncedWithCloudColumn] as int) == 1 ? true : false;

  @override
  String toString() =>
      'Sale: ID = $id, UserID = $userId, Synced = $isSyncedWithCloud, OrderName = $orderName, OrderDate = $orderDate';

  @override
  bool operator ==(covariant DatabaseOrder other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

const dbName = 'orders.db';
const orderTable = 'orders';
const userTable = 'users';
const idColumn = 'id';
const emailColumn = 'email';
const userIdColumn = 'user_id';
const orderNameColumn = 'orderName';
const orderDateColumn = 'orderDate';
const isSyncedWithCloudColumn = 'is_synced_with_cloud';
const createUserTable = '''
        CREATE TABLE IF NOT EXISTS "user" (
	      "id"	INTEGER NOT NULL,
	      "email"	TEXT NOT NULL UNIQUE,
	      PRIMARY KEY("id" AUTOINCREMENT)
        );''';
const createOrdersTable = ''' 
        CREATE TABLE IF NOT EXISTS "orders" (
	      "id"	INTEGER NOT NULL,
	      "user_id"	INTEGER NOT NULL,
	      "order_name"	TEXT NOT NULL,
	      "order_date"	TEXT NOT NULL,
	      "is_synced_with_cloud"	INTEGER NOT NULL DEFAULT 0,
	      PRIMARY KEY("id" AUTOINCREMENT),
	      FOREIGN KEY("user_id") REFERENCES "user"("id")
        );''';
