/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

class ServiceLogEntity {
  String id;
  String uid;
  String? userId;
  String? partnerId;
  String? xid;
  String svcName;
  String svcVersion;
  String? svcParent;
  String endpoint;
  String version;
  String? message;
  String severity; // types: info, warning, error
  String path;
  String function;
  String? reqHeader;
  String? reqBody;
  String? reqPar;
  String? resData;
  int? resCode;
  String? data;
  String? error;
  String? stackTrace;
  String clientIP;
  late int durationMs;
  DateTime startAt;
  DateTime finishAt;
  DateTime createdAt;

  ServiceLogEntity({
    required this.id,
    required this.uid,
    this.userId,
    this.partnerId,
    this.xid,
    required this.svcName,
    required this.svcVersion,
    this.svcParent,
    required this.endpoint,
    required this.version,
    this.message,
    required this.severity,
    required this.path,
    required this.function,
    this.reqHeader,
    this.reqBody,
    this.reqPar,
    this.resData,
    this.resCode,
    this.data,
    this.error,
    this.stackTrace,
    required this.clientIP,
    required this.startAt,
    required this.finishAt,
    required this.createdAt,
  }) {
    durationMs = finishAt.difference(startAt).inMilliseconds;
  }
}
