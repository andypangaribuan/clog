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
  (id, svc_name, svc_parent, message, severity,
   path, function, req_header, req_body, req_par,
   res_data, res_code, data, error, stack_trace,
   duration_ms, start_at, finish_at, created_at)
VALUES
  (@id, @svc_name, @svc_parent, @message, @severity,
   @path, @function, @req_header, @req_body, @req_par,
   @res_data, @res_code, @data, @error, @stack_trace,
   @duration_ms, @start_at, @finish_at, @created_at)
''';

    final pars = {
      'id': e.id,
      'svc_name': e.svcName,
      'svc_parent': e.svcParent,
      'message': e.message,
      'severity': e.severity,
      'path': e.path,
      'function': e.function,
      'req_header': e.reqHeader,
      'req_body': e.reqBody,
      'req_par': e.reqPar,
      'res_data': e.resData,
      'res_code': e.resCode,
      'data': e.data,
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
