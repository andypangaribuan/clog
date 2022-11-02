/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:fdark/fdark.dart';
import 'package:fdation/fdation.dart';

final db = _DB();

class _DB {
  late final FDB _fdb;

  void initialize({
    required String host,
    required int port,
    required String name,
    required String user,
    required String password,
    String? scheme,
    FConnectionSettings? settings,
  }) {
    _fdb = FPostgresDB(
      host: host,
      port: port,
      name: name,
      user: user,
      password: password,
      scheme: scheme,
      settings: settings
    );
  }

  Future<List<FDBRow>> query(String sql, {required FSetError setError, FOnError? onError, Map<String, dynamic>? pars}) {
    return _fdb.query(sql, onError: onError, setError: setError, pars: pars);
  }
}
