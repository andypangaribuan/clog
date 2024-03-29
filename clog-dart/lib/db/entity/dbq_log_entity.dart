/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

class DbqLogEntity {
  String id;
  String uid;
  String? userId;
  String? partnerId;
  String? xid;
  String svcName;
  String svcVersion;
  String? svcParent;
  String sqlQuery;
  String? sqlPars;
  String severity;
  String path;
  String function;
  String? error;
  String? stackTrace;
  late int durationMs;
  DateTime startAt;
  DateTime finishAt;
  DateTime createdAt;

  DbqLogEntity({
    required this.id,
    required this.uid,
    this.userId,
    this.partnerId,
    this.xid,
    required this.svcName,
    required this.svcVersion,
    this.svcParent,
    required this.sqlQuery,
    this.sqlPars,
    required this.severity,
    required this.path,
    required this.function,
    this.error,
    this.stackTrace,
    required this.startAt,
    required this.finishAt,
    required this.createdAt,
  }) {
    durationMs = finishAt.difference(startAt).inMilliseconds;
  }
}
