///
//  Generated code. Do not modify.
//  source: clog.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/wrappers.pb.dart' as $1;

class Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Response', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'clog_svc'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  Response._() : super();
  factory Response({
    $core.String? status,
    $core.String? message,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Response clone() => Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Response copyWith(void Function(Response) updates) => super.copyWith((message) => updates(message as Response)) as Response; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Response create() => Response._();
  Response createEmptyInstance() => create();
  static $pb.PbList<Response> createRepeated() => $pb.PbList<Response>();
  @$core.pragma('dart2js:noInline')
  static Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Response>(create);
  static Response? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class RequestServiceLog extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestServiceLog', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'clog_svc'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aOM<$1.StringValue>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'partnerId', protoName: 'partnerId', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xid', subBuilder: $1.StringValue.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'svcName', protoName: 'svcName')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'svcVersion', protoName: 'svcVersion')
    ..aOM<$1.StringValue>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'svcParent', protoName: 'svcParent', subBuilder: $1.StringValue.create)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endpoint')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'version')
    ..aOM<$1.StringValue>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message', subBuilder: $1.StringValue.create)
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'severity')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'function')
    ..aOM<$1.StringValue>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reqHeader', protoName: 'reqHeader', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reqBody', protoName: 'reqBody', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reqParam', protoName: 'reqParam', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resData', protoName: 'resData', subBuilder: $1.StringValue.create)
    ..aOM<$1.Int32Value>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resCode', protoName: 'resCode', subBuilder: $1.Int32Value.create)
    ..aOM<$1.StringValue>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stackTrace', protoName: 'stackTrace', subBuilder: $1.StringValue.create)
    ..aOS(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientIP', protoName: 'clientIP')
    ..aOS(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startAt', protoName: 'startAt')
    ..aOS(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'finishAt', protoName: 'finishAt')
    ..aOS(25, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt')
    ..hasRequiredFields = false
  ;

  RequestServiceLog._() : super();
  factory RequestServiceLog({
    $core.String? uid,
    $1.StringValue? userId,
    $1.StringValue? partnerId,
    $1.StringValue? xid,
    $core.String? svcName,
    $core.String? svcVersion,
    $1.StringValue? svcParent,
    $core.String? endpoint,
    $core.String? version,
    $1.StringValue? message,
    $core.String? severity,
    $core.String? path,
    $core.String? function,
    $1.StringValue? reqHeader,
    $1.StringValue? reqBody,
    $1.StringValue? reqParam,
    $1.StringValue? resData,
    $1.Int32Value? resCode,
    $1.StringValue? data,
    $1.StringValue? error,
    $1.StringValue? stackTrace,
    $core.String? clientIP,
    $core.String? startAt,
    $core.String? finishAt,
    $core.String? createdAt,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (partnerId != null) {
      _result.partnerId = partnerId;
    }
    if (xid != null) {
      _result.xid = xid;
    }
    if (svcName != null) {
      _result.svcName = svcName;
    }
    if (svcVersion != null) {
      _result.svcVersion = svcVersion;
    }
    if (svcParent != null) {
      _result.svcParent = svcParent;
    }
    if (endpoint != null) {
      _result.endpoint = endpoint;
    }
    if (version != null) {
      _result.version = version;
    }
    if (message != null) {
      _result.message = message;
    }
    if (severity != null) {
      _result.severity = severity;
    }
    if (path != null) {
      _result.path = path;
    }
    if (function != null) {
      _result.function = function;
    }
    if (reqHeader != null) {
      _result.reqHeader = reqHeader;
    }
    if (reqBody != null) {
      _result.reqBody = reqBody;
    }
    if (reqParam != null) {
      _result.reqParam = reqParam;
    }
    if (resData != null) {
      _result.resData = resData;
    }
    if (resCode != null) {
      _result.resCode = resCode;
    }
    if (data != null) {
      _result.data = data;
    }
    if (error != null) {
      _result.error = error;
    }
    if (stackTrace != null) {
      _result.stackTrace = stackTrace;
    }
    if (clientIP != null) {
      _result.clientIP = clientIP;
    }
    if (startAt != null) {
      _result.startAt = startAt;
    }
    if (finishAt != null) {
      _result.finishAt = finishAt;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    return _result;
  }
  factory RequestServiceLog.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestServiceLog.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestServiceLog clone() => RequestServiceLog()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestServiceLog copyWith(void Function(RequestServiceLog) updates) => super.copyWith((message) => updates(message as RequestServiceLog)) as RequestServiceLog; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestServiceLog create() => RequestServiceLog._();
  RequestServiceLog createEmptyInstance() => create();
  static $pb.PbList<RequestServiceLog> createRepeated() => $pb.PbList<RequestServiceLog>();
  @$core.pragma('dart2js:noInline')
  static RequestServiceLog getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestServiceLog>(create);
  static RequestServiceLog? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $1.StringValue get userId => $_getN(1);
  @$pb.TagNumber(2)
  set userId($1.StringValue v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
  @$pb.TagNumber(2)
  $1.StringValue ensureUserId() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.StringValue get partnerId => $_getN(2);
  @$pb.TagNumber(3)
  set partnerId($1.StringValue v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPartnerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPartnerId() => clearField(3);
  @$pb.TagNumber(3)
  $1.StringValue ensurePartnerId() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.StringValue get xid => $_getN(3);
  @$pb.TagNumber(4)
  set xid($1.StringValue v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasXid() => $_has(3);
  @$pb.TagNumber(4)
  void clearXid() => clearField(4);
  @$pb.TagNumber(4)
  $1.StringValue ensureXid() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get svcName => $_getSZ(4);
  @$pb.TagNumber(5)
  set svcName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSvcName() => $_has(4);
  @$pb.TagNumber(5)
  void clearSvcName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get svcVersion => $_getSZ(5);
  @$pb.TagNumber(6)
  set svcVersion($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSvcVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearSvcVersion() => clearField(6);

  @$pb.TagNumber(7)
  $1.StringValue get svcParent => $_getN(6);
  @$pb.TagNumber(7)
  set svcParent($1.StringValue v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasSvcParent() => $_has(6);
  @$pb.TagNumber(7)
  void clearSvcParent() => clearField(7);
  @$pb.TagNumber(7)
  $1.StringValue ensureSvcParent() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get endpoint => $_getSZ(7);
  @$pb.TagNumber(8)
  set endpoint($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEndpoint() => $_has(7);
  @$pb.TagNumber(8)
  void clearEndpoint() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get version => $_getSZ(8);
  @$pb.TagNumber(9)
  set version($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasVersion() => $_has(8);
  @$pb.TagNumber(9)
  void clearVersion() => clearField(9);

  @$pb.TagNumber(10)
  $1.StringValue get message => $_getN(9);
  @$pb.TagNumber(10)
  set message($1.StringValue v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasMessage() => $_has(9);
  @$pb.TagNumber(10)
  void clearMessage() => clearField(10);
  @$pb.TagNumber(10)
  $1.StringValue ensureMessage() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get severity => $_getSZ(10);
  @$pb.TagNumber(11)
  set severity($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSeverity() => $_has(10);
  @$pb.TagNumber(11)
  void clearSeverity() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get path => $_getSZ(11);
  @$pb.TagNumber(12)
  set path($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasPath() => $_has(11);
  @$pb.TagNumber(12)
  void clearPath() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get function => $_getSZ(12);
  @$pb.TagNumber(13)
  set function($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasFunction() => $_has(12);
  @$pb.TagNumber(13)
  void clearFunction() => clearField(13);

  @$pb.TagNumber(14)
  $1.StringValue get reqHeader => $_getN(13);
  @$pb.TagNumber(14)
  set reqHeader($1.StringValue v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasReqHeader() => $_has(13);
  @$pb.TagNumber(14)
  void clearReqHeader() => clearField(14);
  @$pb.TagNumber(14)
  $1.StringValue ensureReqHeader() => $_ensure(13);

  @$pb.TagNumber(15)
  $1.StringValue get reqBody => $_getN(14);
  @$pb.TagNumber(15)
  set reqBody($1.StringValue v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasReqBody() => $_has(14);
  @$pb.TagNumber(15)
  void clearReqBody() => clearField(15);
  @$pb.TagNumber(15)
  $1.StringValue ensureReqBody() => $_ensure(14);

  @$pb.TagNumber(16)
  $1.StringValue get reqParam => $_getN(15);
  @$pb.TagNumber(16)
  set reqParam($1.StringValue v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasReqParam() => $_has(15);
  @$pb.TagNumber(16)
  void clearReqParam() => clearField(16);
  @$pb.TagNumber(16)
  $1.StringValue ensureReqParam() => $_ensure(15);

  @$pb.TagNumber(17)
  $1.StringValue get resData => $_getN(16);
  @$pb.TagNumber(17)
  set resData($1.StringValue v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasResData() => $_has(16);
  @$pb.TagNumber(17)
  void clearResData() => clearField(17);
  @$pb.TagNumber(17)
  $1.StringValue ensureResData() => $_ensure(16);

  @$pb.TagNumber(18)
  $1.Int32Value get resCode => $_getN(17);
  @$pb.TagNumber(18)
  set resCode($1.Int32Value v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasResCode() => $_has(17);
  @$pb.TagNumber(18)
  void clearResCode() => clearField(18);
  @$pb.TagNumber(18)
  $1.Int32Value ensureResCode() => $_ensure(17);

  @$pb.TagNumber(19)
  $1.StringValue get data => $_getN(18);
  @$pb.TagNumber(19)
  set data($1.StringValue v) { setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasData() => $_has(18);
  @$pb.TagNumber(19)
  void clearData() => clearField(19);
  @$pb.TagNumber(19)
  $1.StringValue ensureData() => $_ensure(18);

  @$pb.TagNumber(20)
  $1.StringValue get error => $_getN(19);
  @$pb.TagNumber(20)
  set error($1.StringValue v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasError() => $_has(19);
  @$pb.TagNumber(20)
  void clearError() => clearField(20);
  @$pb.TagNumber(20)
  $1.StringValue ensureError() => $_ensure(19);

  @$pb.TagNumber(21)
  $1.StringValue get stackTrace => $_getN(20);
  @$pb.TagNumber(21)
  set stackTrace($1.StringValue v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasStackTrace() => $_has(20);
  @$pb.TagNumber(21)
  void clearStackTrace() => clearField(21);
  @$pb.TagNumber(21)
  $1.StringValue ensureStackTrace() => $_ensure(20);

  @$pb.TagNumber(22)
  $core.String get clientIP => $_getSZ(21);
  @$pb.TagNumber(22)
  set clientIP($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasClientIP() => $_has(21);
  @$pb.TagNumber(22)
  void clearClientIP() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get startAt => $_getSZ(22);
  @$pb.TagNumber(23)
  set startAt($core.String v) { $_setString(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasStartAt() => $_has(22);
  @$pb.TagNumber(23)
  void clearStartAt() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get finishAt => $_getSZ(23);
  @$pb.TagNumber(24)
  set finishAt($core.String v) { $_setString(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasFinishAt() => $_has(23);
  @$pb.TagNumber(24)
  void clearFinishAt() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get createdAt => $_getSZ(24);
  @$pb.TagNumber(25)
  set createdAt($core.String v) { $_setString(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasCreatedAt() => $_has(24);
  @$pb.TagNumber(25)
  void clearCreatedAt() => clearField(25);
}

class RequestInfoLog extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestInfoLog', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'clog_svc'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aOM<$1.StringValue>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'partnerId', protoName: 'partnerId', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xid', subBuilder: $1.StringValue.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'svcName', protoName: 'svcName')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'svcVersion', protoName: 'svcVersion')
    ..aOM<$1.StringValue>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'svcParent', protoName: 'svcParent', subBuilder: $1.StringValue.create)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'severity')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'function')
    ..aOM<$1.StringValue>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: $1.StringValue.create)
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt')
    ..hasRequiredFields = false
  ;

  RequestInfoLog._() : super();
  factory RequestInfoLog({
    $core.String? uid,
    $1.StringValue? userId,
    $1.StringValue? partnerId,
    $1.StringValue? xid,
    $core.String? svcName,
    $core.String? svcVersion,
    $1.StringValue? svcParent,
    $core.String? message,
    $core.String? severity,
    $core.String? path,
    $core.String? function,
    $1.StringValue? data,
    $core.String? createdAt,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (partnerId != null) {
      _result.partnerId = partnerId;
    }
    if (xid != null) {
      _result.xid = xid;
    }
    if (svcName != null) {
      _result.svcName = svcName;
    }
    if (svcVersion != null) {
      _result.svcVersion = svcVersion;
    }
    if (svcParent != null) {
      _result.svcParent = svcParent;
    }
    if (message != null) {
      _result.message = message;
    }
    if (severity != null) {
      _result.severity = severity;
    }
    if (path != null) {
      _result.path = path;
    }
    if (function != null) {
      _result.function = function;
    }
    if (data != null) {
      _result.data = data;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    return _result;
  }
  factory RequestInfoLog.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestInfoLog.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestInfoLog clone() => RequestInfoLog()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestInfoLog copyWith(void Function(RequestInfoLog) updates) => super.copyWith((message) => updates(message as RequestInfoLog)) as RequestInfoLog; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestInfoLog create() => RequestInfoLog._();
  RequestInfoLog createEmptyInstance() => create();
  static $pb.PbList<RequestInfoLog> createRepeated() => $pb.PbList<RequestInfoLog>();
  @$core.pragma('dart2js:noInline')
  static RequestInfoLog getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestInfoLog>(create);
  static RequestInfoLog? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $1.StringValue get userId => $_getN(1);
  @$pb.TagNumber(2)
  set userId($1.StringValue v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
  @$pb.TagNumber(2)
  $1.StringValue ensureUserId() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.StringValue get partnerId => $_getN(2);
  @$pb.TagNumber(3)
  set partnerId($1.StringValue v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPartnerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPartnerId() => clearField(3);
  @$pb.TagNumber(3)
  $1.StringValue ensurePartnerId() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.StringValue get xid => $_getN(3);
  @$pb.TagNumber(4)
  set xid($1.StringValue v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasXid() => $_has(3);
  @$pb.TagNumber(4)
  void clearXid() => clearField(4);
  @$pb.TagNumber(4)
  $1.StringValue ensureXid() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get svcName => $_getSZ(4);
  @$pb.TagNumber(5)
  set svcName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSvcName() => $_has(4);
  @$pb.TagNumber(5)
  void clearSvcName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get svcVersion => $_getSZ(5);
  @$pb.TagNumber(6)
  set svcVersion($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSvcVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearSvcVersion() => clearField(6);

  @$pb.TagNumber(7)
  $1.StringValue get svcParent => $_getN(6);
  @$pb.TagNumber(7)
  set svcParent($1.StringValue v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasSvcParent() => $_has(6);
  @$pb.TagNumber(7)
  void clearSvcParent() => clearField(7);
  @$pb.TagNumber(7)
  $1.StringValue ensureSvcParent() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get message => $_getSZ(7);
  @$pb.TagNumber(8)
  set message($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMessage() => $_has(7);
  @$pb.TagNumber(8)
  void clearMessage() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get severity => $_getSZ(8);
  @$pb.TagNumber(9)
  set severity($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSeverity() => $_has(8);
  @$pb.TagNumber(9)
  void clearSeverity() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get path => $_getSZ(9);
  @$pb.TagNumber(10)
  set path($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPath() => $_has(9);
  @$pb.TagNumber(10)
  void clearPath() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get function => $_getSZ(10);
  @$pb.TagNumber(11)
  set function($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasFunction() => $_has(10);
  @$pb.TagNumber(11)
  void clearFunction() => clearField(11);

  @$pb.TagNumber(12)
  $1.StringValue get data => $_getN(11);
  @$pb.TagNumber(12)
  set data($1.StringValue v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasData() => $_has(11);
  @$pb.TagNumber(12)
  void clearData() => clearField(12);
  @$pb.TagNumber(12)
  $1.StringValue ensureData() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.String get createdAt => $_getSZ(12);
  @$pb.TagNumber(13)
  set createdAt($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasCreatedAt() => $_has(12);
  @$pb.TagNumber(13)
  void clearCreatedAt() => clearField(13);
}

class RequestDbqLog extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestDbqLog', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'clog_svc'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aOM<$1.StringValue>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'partnerId', protoName: 'partnerId', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xid', subBuilder: $1.StringValue.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'svcName', protoName: 'svcName')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'svcVersion', protoName: 'svcVersion')
    ..aOM<$1.StringValue>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'svcParent', protoName: 'svcParent', subBuilder: $1.StringValue.create)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sqlQuery', protoName: 'sqlQuery')
    ..aOM<$1.StringValue>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sqlPars', protoName: 'sqlPars', subBuilder: $1.StringValue.create)
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'severity')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'function')
    ..aOM<$1.StringValue>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stackTrace', protoName: 'stackTrace', subBuilder: $1.StringValue.create)
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startAt', protoName: 'startAt')
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'finishAt', protoName: 'finishAt')
    ..aOS(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt')
    ..hasRequiredFields = false
  ;

  RequestDbqLog._() : super();
  factory RequestDbqLog({
    $core.String? uid,
    $1.StringValue? userId,
    $1.StringValue? partnerId,
    $1.StringValue? xid,
    $core.String? svcName,
    $core.String? svcVersion,
    $1.StringValue? svcParent,
    $core.String? sqlQuery,
    $1.StringValue? sqlPars,
    $core.String? severity,
    $core.String? path,
    $core.String? function,
    $1.StringValue? error,
    $1.StringValue? stackTrace,
    $core.String? startAt,
    $core.String? finishAt,
    $core.String? createdAt,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (partnerId != null) {
      _result.partnerId = partnerId;
    }
    if (xid != null) {
      _result.xid = xid;
    }
    if (svcName != null) {
      _result.svcName = svcName;
    }
    if (svcVersion != null) {
      _result.svcVersion = svcVersion;
    }
    if (svcParent != null) {
      _result.svcParent = svcParent;
    }
    if (sqlQuery != null) {
      _result.sqlQuery = sqlQuery;
    }
    if (sqlPars != null) {
      _result.sqlPars = sqlPars;
    }
    if (severity != null) {
      _result.severity = severity;
    }
    if (path != null) {
      _result.path = path;
    }
    if (function != null) {
      _result.function = function;
    }
    if (error != null) {
      _result.error = error;
    }
    if (stackTrace != null) {
      _result.stackTrace = stackTrace;
    }
    if (startAt != null) {
      _result.startAt = startAt;
    }
    if (finishAt != null) {
      _result.finishAt = finishAt;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    return _result;
  }
  factory RequestDbqLog.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestDbqLog.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestDbqLog clone() => RequestDbqLog()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestDbqLog copyWith(void Function(RequestDbqLog) updates) => super.copyWith((message) => updates(message as RequestDbqLog)) as RequestDbqLog; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestDbqLog create() => RequestDbqLog._();
  RequestDbqLog createEmptyInstance() => create();
  static $pb.PbList<RequestDbqLog> createRepeated() => $pb.PbList<RequestDbqLog>();
  @$core.pragma('dart2js:noInline')
  static RequestDbqLog getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestDbqLog>(create);
  static RequestDbqLog? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $1.StringValue get userId => $_getN(1);
  @$pb.TagNumber(2)
  set userId($1.StringValue v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
  @$pb.TagNumber(2)
  $1.StringValue ensureUserId() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.StringValue get partnerId => $_getN(2);
  @$pb.TagNumber(3)
  set partnerId($1.StringValue v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPartnerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPartnerId() => clearField(3);
  @$pb.TagNumber(3)
  $1.StringValue ensurePartnerId() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.StringValue get xid => $_getN(3);
  @$pb.TagNumber(4)
  set xid($1.StringValue v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasXid() => $_has(3);
  @$pb.TagNumber(4)
  void clearXid() => clearField(4);
  @$pb.TagNumber(4)
  $1.StringValue ensureXid() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get svcName => $_getSZ(4);
  @$pb.TagNumber(5)
  set svcName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSvcName() => $_has(4);
  @$pb.TagNumber(5)
  void clearSvcName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get svcVersion => $_getSZ(5);
  @$pb.TagNumber(6)
  set svcVersion($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSvcVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearSvcVersion() => clearField(6);

  @$pb.TagNumber(7)
  $1.StringValue get svcParent => $_getN(6);
  @$pb.TagNumber(7)
  set svcParent($1.StringValue v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasSvcParent() => $_has(6);
  @$pb.TagNumber(7)
  void clearSvcParent() => clearField(7);
  @$pb.TagNumber(7)
  $1.StringValue ensureSvcParent() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get sqlQuery => $_getSZ(7);
  @$pb.TagNumber(8)
  set sqlQuery($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSqlQuery() => $_has(7);
  @$pb.TagNumber(8)
  void clearSqlQuery() => clearField(8);

  @$pb.TagNumber(9)
  $1.StringValue get sqlPars => $_getN(8);
  @$pb.TagNumber(9)
  set sqlPars($1.StringValue v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasSqlPars() => $_has(8);
  @$pb.TagNumber(9)
  void clearSqlPars() => clearField(9);
  @$pb.TagNumber(9)
  $1.StringValue ensureSqlPars() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get severity => $_getSZ(9);
  @$pb.TagNumber(10)
  set severity($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSeverity() => $_has(9);
  @$pb.TagNumber(10)
  void clearSeverity() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get path => $_getSZ(10);
  @$pb.TagNumber(11)
  set path($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasPath() => $_has(10);
  @$pb.TagNumber(11)
  void clearPath() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get function => $_getSZ(11);
  @$pb.TagNumber(12)
  set function($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasFunction() => $_has(11);
  @$pb.TagNumber(12)
  void clearFunction() => clearField(12);

  @$pb.TagNumber(13)
  $1.StringValue get error => $_getN(12);
  @$pb.TagNumber(13)
  set error($1.StringValue v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasError() => $_has(12);
  @$pb.TagNumber(13)
  void clearError() => clearField(13);
  @$pb.TagNumber(13)
  $1.StringValue ensureError() => $_ensure(12);

  @$pb.TagNumber(14)
  $1.StringValue get stackTrace => $_getN(13);
  @$pb.TagNumber(14)
  set stackTrace($1.StringValue v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasStackTrace() => $_has(13);
  @$pb.TagNumber(14)
  void clearStackTrace() => clearField(14);
  @$pb.TagNumber(14)
  $1.StringValue ensureStackTrace() => $_ensure(13);

  @$pb.TagNumber(15)
  $core.String get startAt => $_getSZ(14);
  @$pb.TagNumber(15)
  set startAt($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasStartAt() => $_has(14);
  @$pb.TagNumber(15)
  void clearStartAt() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get finishAt => $_getSZ(15);
  @$pb.TagNumber(16)
  set finishAt($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasFinishAt() => $_has(15);
  @$pb.TagNumber(16)
  void clearFinishAt() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get createdAt => $_getSZ(16);
  @$pb.TagNumber(17)
  set createdAt($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasCreatedAt() => $_has(16);
  @$pb.TagNumber(17)
  void clearCreatedAt() => clearField(17);
}

