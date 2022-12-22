/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of clog_service;

Future<Response> serviceLogHandler(RequestServiceLog req) async {
  late final DateTime startAt;
  late final DateTime finishAt;
  late final DateTime createdAt;

  try {
    startAt = DateTime.parse(req.startAt).toLocal();
    finishAt = DateTime.parse(req.finishAt).toLocal();
    createdAt = DateTime.parse(req.createdAt).toLocal();
  } catch (err) {
    return Response(status: 'failed', message: 'found error | $err');
  }

  final id = fd.func.generateUniqueId();

  final entity = ServiceLogEntity(
    id: id,
    uid: req.uid,
    svcName: req.svcName,
    svcParent: req.svcParent.val,
    message: req.message.val,
    severity: req.severity.isEmpty ? 'undefined' : req.severity,
    path: req.path,
    function: req.function,
    reqHeader: req.reqHeader.val,
    reqBody: req.reqBody.val,
    reqPar: req.reqParam.val,
    resData: req.resData.val,
    resCode: req.resCode.val,
    data: req.data.val,
    error: req.error.val,
    stackTrace: req.stackTrace.val,
    clientIP: req.clientIP,
    startAt: startAt,
    finishAt: finishAt,
    createdAt: createdAt,
  );

  final res = await repo.serviceLog.insert(entity);
  if (res.isError) {
    final err = res.err == null ? '-' : res.err!.toString();
    final stackTrace = res.stackTrace == null ? '-' : res.stackTrace!.toString();
    return Response(status: 'failed', message: ':: $err\n:: $stackTrace');
  }

  return Response(status: 'success');
}
