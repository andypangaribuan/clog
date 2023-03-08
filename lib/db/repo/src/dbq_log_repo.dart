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
  (id, uid, user_id, partner_id, xid,
   svc_name, svc_version, svc_parent, sql_query, sql_pars,
   severity, path, function, error, stack_trace,
   duration_ms, start_at, finish_at, created_at)
VALUES
  (@id, @uid, @user_id, @partner_id, @xid,
   @svc_name, @svc_version, @svc_parent, @sql_query, @sql_pars,
   @severity, @path, @function, @error, @stack_trace,
   @duration_ms, @start_at, @finish_at, @created_at)
''';

    final pars = {
      'id': e.id,
      'uid': e.uid,
      'user_id': e.userId,
      'partner_id': e.partnerId,
      'xid': e.xid,
      'svc_name': e.svcName,
      'svc_version': e.svcVersion,
      'svc_parent': e.svcParent,
      'sql_query': e.sqlQuery,
      'sql_pars': e.sqlPars,
      'severity': e.severity,
      'path': e.path,
      'function': e.function,
      'error': e.error,
      'stack_trace': e.stackTrace,
      'duration_ms': e.durationMs,
      'start_at': e.startAt,
      'finish_at': e.finishAt,
      'created_at': e.createdAt,
    };

    return await app.db.execute(sql: sql, pars: pars);
  }
}
