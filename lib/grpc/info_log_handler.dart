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

  final id = fd.func.generateUniqueId();

  final entity = InfoLogEntity(
    id: id,
    uid: req.uid,
    userId: req.userId.val,
    partnerId: req.partnerId.val,
    xid: req.xid.val,
    svcName: req.svcName,
    svcVersion: req.svcVersion,
    svcParent: req.svcParent.val,
    message: req.message,
    severity: req.severity.isEmpty ? 'undefined' : req.severity,
    path: req.path,
    function: req.function,
    data: req.data.val,
    createdAt: createdAt,
  );

  final res = await repo.infoLog.insert(entity);
  if (res.isError) {
    final err = res.err == null ? '-' : res.err!.toString();
    final stackTrace = res.stackTrace == null ? '-' : res.stackTrace!.toString();

    if (res.err != null) {
      print(res.err);
    }

    if (res.stackTrace != null) {
      print(res.stackTrace);
    }

    return Response(status: 'failed', message: 'info :: $err\n:: $stackTrace');
  }

  return Response(status: 'success');
}
