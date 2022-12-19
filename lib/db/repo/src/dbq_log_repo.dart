/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of db_repo;

class _DbqLogRepo {
  Future<FError> insert(DbqLogEntity e) async {
    final sql = '''
INSERT INTO dbq_log
  (id, uid, svc_name, svc_parent, sql_query,
   sql_pars, severity, path, function, error,
   stack_trace, duration_ms, start_at, finish_at, created_at)
VALUES
  (@id, @uid, @svcName, @svcParent, @sqlQuery,
   @sqlPars, @severity, @path, @function, @error,
   @stackTrace, @durationMs, @startAt, @finishAt, @createdAt)
''';

    final pars = {
      'id': e.id,
      'uid': e.uid,
      'svcName': e.svcName,
      'svcParent': e.svcParent,
      'sqlQuery': e.sqlQuery,
      'sqlPars': e.sqlPars,
      'severity': e.severity,
      'path': e.path,
      'function': e.function,
      'error': e.error,
      'stackTrace': e.stackTrace,
      'durationMs': e.durationMs,
      'startAt': e.startAt,
      'finishAt': e.finishAt,
      'createdAt': e.createdAt,
    };

    return await app.db.execute(sql: sql, pars: pars);
  }
}
