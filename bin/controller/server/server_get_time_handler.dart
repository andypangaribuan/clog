/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of server_ctrl;

class _GetTimeHandler extends FuseHandler {
  late final String auth = objAuthX.to<String>()!;

  @override
  Future<FuseResponse> handler(FuseContext ctx) async {
    final err = FError.notError();
    final rows = await db.query(
      'SELECT * FROM users LIMIT 3',
      setError: () => err,
    );

    if (err.isError) {
      return ctx.ok('error: ${err.stackTrace}');
    }

    if (rows.isEmpty) {
      return ctx.ok('rows is empty');
    }

    final users = rows.loopToList((row) => User.fromRow(row));
    return ctx.ok(users);
  }
}

class User extends FJsonSerializable {
  int id;
  String name;
  String email;
  int? idNumber;
  bool isActive;
  bool isFirstLogin;
  DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.idNumber,
    required this.isActive,
    required this.isFirstLogin,
    required this.createdAt,
  });

  factory User.fromRow(FDBRow row) {
    return User(
      id: row['id'],
      name: row.get('name')!,
      email: row['email'],
      idNumber: row.get('id_number'),
      isActive: row['is_active'],
      isFirstLogin: row.get('firstLogin')!,
      createdAt: row.get('created_at'),
    );
  }

  @override
  Map<String, dynamic> serialize() {
    final keys = <String>[];
    return omitempty(keys, {
      'id': id,
      'name': name,
      'email': email,
      'idNumber': idNumber,
      'isActive': isActive,
      'isFirstLogin': isFirstLogin,
      'createdAt': createdAt,
    });
  }
}
