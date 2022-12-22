/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of db_repo;

class _ServiceLogRepo {
  Future<FError> insert(ServiceLogEntity e) async {
    final sql = '''
INSERT INTO service_log
  (id, uid, svc_name, svc_parent, endpoint,
   message, severity, path, function, req_header,
   req_body, req_par, res_data, res_code, data,
   error, stack_trace, client_ip, duration_ms, start_at,
   finish_at, created_at)
VALUES
  (@id, @uid, @svcName, @svcParent, @endpoint,
   @message, @severity, @path, @function, @reqHeader,
   @reqBody, @reqPar, @resData, @resCode, @data,
   @error, @stackTrace, @clientIP, @durationMs, @startAt,
   @finishAt, @createdAt)
''';

    final pars = {
      'id': e.id,
      'uid': e.uid,
      'svcName': e.svcName,
      'svcParent': e.svcParent,
      'endpoint': e.endpoint,
      'message': e.message,
      'severity': e.severity,
      'path': e.path,
      'function': e.function,
      'reqHeader': e.reqHeader,
      'reqBody': e.reqBody,
      'reqPar': e.reqPar,
      'resData': e.resData,
      'resCode': e.resCode,
      'data': e.data,
      'error': e.error,
      'stackTrace': e.stackTrace,
      'clientIP': e.clientIP,
      'durationMs': e.durationMs,
      'startAt': e.startAt,
      'finishAt': e.finishAt,
      'createdAt': e.createdAt,
    };

    return await app.db.execute(sql: sql, pars: pars);
  }
}
