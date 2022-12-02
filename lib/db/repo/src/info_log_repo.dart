/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of db_repo;

class _InfoLogRepo {
  Future<FError> insert(InfoLogEntity e) async {
    final sql = '''
INSERT INTO info_log
  (id, svc_name, svc_parent, message, severity,
   path, function, data, created_at)
VALUES
  (@id, @svc_name, @svc_parent, @message, @severity,
   @path, @function, @data, @created_at)
''';

    final pars = {
      'id': e.id,
      'svc_name': e.svcName,
      'svc_parent': e.svcParent,
      'message': e.message,
      'severity': e.severity,
      'path': e.path,
      'function': e.function,
      'data': e.data,
      'created_at': e.createdAt,
    };

    return await app.db.execute(sql: sql, pars: pars);
  }
}
