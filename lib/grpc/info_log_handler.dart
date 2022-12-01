/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of clog_service;

Future<Response> infoLogHandler(RequestInfoLog req) async {
  late final DateTime createdAt;

  try {
    createdAt = DateTime.parse(req.createdAt).toLocal();
  } catch (err) {
    return Response(status: 'failed', message: 'found error | $err');
  }

  final entity = InfoLogEntity(
    id: req.id,
    svcName: req.svcName,
    svcParent: req.svcParent.val,
    message: req.message,
    severity: req.severity,
    data: req.data.val,
    createdAt: createdAt,
  );

  final res = await repo.infoLog.insert(entity);
  if (res.isError) {
    final err = res.err == null ? '-' : res.err!.toString();
    final stackTrace = res.stackTrace == null ? '-' : res.stackTrace!.toString();
    return Response(status: 'failed', message: ':: $err\n:: $stackTrace');
  }

  return Response(status: 'success');
}
