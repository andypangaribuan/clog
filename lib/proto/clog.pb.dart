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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Response', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'clog'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestServiceLog', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'clog'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'svcName', protoName: 'svcName')
    ..aOM<$1.StringValue>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'svcParent', protoName: 'svcParent', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message', subBuilder: $1.StringValue.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'severity')
    ..aOM<$1.StringValue>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reqHeader', protoName: 'reqHeader', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reqBody', protoName: 'reqBody', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reqPar', protoName: 'reqPar', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resData', protoName: 'resData', subBuilder: $1.StringValue.create)
    ..aOM<$1.Int32Value>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resCode', protoName: 'resCode', subBuilder: $1.Int32Value.create)
    ..aOM<$1.StringValue>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stackTrace', protoName: 'stackTrace', subBuilder: $1.StringValue.create)
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startAt', protoName: 'startAt')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'finishAt', protoName: 'finishAt')
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt')
    ..hasRequiredFields = false
  ;

  RequestServiceLog._() : super();
  factory RequestServiceLog({
    $core.String? id,
    $core.String? svcName,
    $1.StringValue? svcParent,
    $1.StringValue? message,
    $core.String? severity,
    $1.StringValue? reqHeader,
    $1.StringValue? reqBody,
    $1.StringValue? reqPar,
    $1.StringValue? resData,
    $1.Int32Value? resCode,
    $1.StringValue? data,
    $1.StringValue? error,
    $1.StringValue? stackTrace,
    $core.String? startAt,
    $core.String? finishAt,
    $core.String? createdAt,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (svcName != null) {
      _result.svcName = svcName;
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
    if (reqHeader != null) {
      _result.reqHeader = reqHeader;
    }
    if (reqBody != null) {
      _result.reqBody = reqBody;
    }
    if (reqPar != null) {
      _result.reqPar = reqPar;
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
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get svcName => $_getSZ(1);
  @$pb.TagNumber(2)
  set svcName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSvcName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSvcName() => clearField(2);

  @$pb.TagNumber(3)
  $1.StringValue get svcParent => $_getN(2);
  @$pb.TagNumber(3)
  set svcParent($1.StringValue v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSvcParent() => $_has(2);
  @$pb.TagNumber(3)
  void clearSvcParent() => clearField(3);
  @$pb.TagNumber(3)
  $1.StringValue ensureSvcParent() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.StringValue get message => $_getN(3);
  @$pb.TagNumber(4)
  set message($1.StringValue v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);
  @$pb.TagNumber(4)
  $1.StringValue ensureMessage() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get severity => $_getSZ(4);
  @$pb.TagNumber(5)
  set severity($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSeverity() => $_has(4);
  @$pb.TagNumber(5)
  void clearSeverity() => clearField(5);

  @$pb.TagNumber(6)
  $1.StringValue get reqHeader => $_getN(5);
  @$pb.TagNumber(6)
  set reqHeader($1.StringValue v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasReqHeader() => $_has(5);
  @$pb.TagNumber(6)
  void clearReqHeader() => clearField(6);
  @$pb.TagNumber(6)
  $1.StringValue ensureReqHeader() => $_ensure(5);

  @$pb.TagNumber(7)
  $1.StringValue get reqBody => $_getN(6);
  @$pb.TagNumber(7)
  set reqBody($1.StringValue v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasReqBody() => $_has(6);
  @$pb.TagNumber(7)
  void clearReqBody() => clearField(7);
  @$pb.TagNumber(7)
  $1.StringValue ensureReqBody() => $_ensure(6);

  @$pb.TagNumber(8)
  $1.StringValue get reqPar => $_getN(7);
  @$pb.TagNumber(8)
  set reqPar($1.StringValue v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasReqPar() => $_has(7);
  @$pb.TagNumber(8)
  void clearReqPar() => clearField(8);
  @$pb.TagNumber(8)
  $1.StringValue ensureReqPar() => $_ensure(7);

  @$pb.TagNumber(9)
  $1.StringValue get resData => $_getN(8);
  @$pb.TagNumber(9)
  set resData($1.StringValue v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasResData() => $_has(8);
  @$pb.TagNumber(9)
  void clearResData() => clearField(9);
  @$pb.TagNumber(9)
  $1.StringValue ensureResData() => $_ensure(8);

  @$pb.TagNumber(10)
  $1.Int32Value get resCode => $_getN(9);
  @$pb.TagNumber(10)
  set resCode($1.Int32Value v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasResCode() => $_has(9);
  @$pb.TagNumber(10)
  void clearResCode() => clearField(10);
  @$pb.TagNumber(10)
  $1.Int32Value ensureResCode() => $_ensure(9);

  @$pb.TagNumber(11)
  $1.StringValue get data => $_getN(10);
  @$pb.TagNumber(11)
  set data($1.StringValue v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasData() => $_has(10);
  @$pb.TagNumber(11)
  void clearData() => clearField(11);
  @$pb.TagNumber(11)
  $1.StringValue ensureData() => $_ensure(10);

  @$pb.TagNumber(12)
  $1.StringValue get error => $_getN(11);
  @$pb.TagNumber(12)
  set error($1.StringValue v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasError() => $_has(11);
  @$pb.TagNumber(12)
  void clearError() => clearField(12);
  @$pb.TagNumber(12)
  $1.StringValue ensureError() => $_ensure(11);

  @$pb.TagNumber(13)
  $1.StringValue get stackTrace => $_getN(12);
  @$pb.TagNumber(13)
  set stackTrace($1.StringValue v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasStackTrace() => $_has(12);
  @$pb.TagNumber(13)
  void clearStackTrace() => clearField(13);
  @$pb.TagNumber(13)
  $1.StringValue ensureStackTrace() => $_ensure(12);

  @$pb.TagNumber(14)
  $core.String get startAt => $_getSZ(13);
  @$pb.TagNumber(14)
  set startAt($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasStartAt() => $_has(13);
  @$pb.TagNumber(14)
  void clearStartAt() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get finishAt => $_getSZ(14);
  @$pb.TagNumber(15)
  set finishAt($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasFinishAt() => $_has(14);
  @$pb.TagNumber(15)
  void clearFinishAt() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get createdAt => $_getSZ(15);
  @$pb.TagNumber(16)
  set createdAt($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasCreatedAt() => $_has(15);
  @$pb.TagNumber(16)
  void clearCreatedAt() => clearField(16);
}

class RequestInfoLog extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestInfoLog', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'clog'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'svcName', protoName: 'svcName')
    ..aOM<$1.StringValue>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'svcParent', protoName: 'svcParent', subBuilder: $1.StringValue.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'severity')
    ..aOM<$1.StringValue>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: $1.StringValue.create)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt')
    ..hasRequiredFields = false
  ;

  RequestInfoLog._() : super();
  factory RequestInfoLog({
    $core.String? id,
    $core.String? svcName,
    $1.StringValue? svcParent,
    $core.String? message,
    $core.String? severity,
    $1.StringValue? data,
    $core.String? createdAt,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (svcName != null) {
      _result.svcName = svcName;
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
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get svcName => $_getSZ(1);
  @$pb.TagNumber(2)
  set svcName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSvcName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSvcName() => clearField(2);

  @$pb.TagNumber(3)
  $1.StringValue get svcParent => $_getN(2);
  @$pb.TagNumber(3)
  set svcParent($1.StringValue v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSvcParent() => $_has(2);
  @$pb.TagNumber(3)
  void clearSvcParent() => clearField(3);
  @$pb.TagNumber(3)
  $1.StringValue ensureSvcParent() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get severity => $_getSZ(4);
  @$pb.TagNumber(5)
  set severity($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSeverity() => $_has(4);
  @$pb.TagNumber(5)
  void clearSeverity() => clearField(5);

  @$pb.TagNumber(6)
  $1.StringValue get data => $_getN(5);
  @$pb.TagNumber(6)
  set data($1.StringValue v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasData() => $_has(5);
  @$pb.TagNumber(6)
  void clearData() => clearField(6);
  @$pb.TagNumber(6)
  $1.StringValue ensureData() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get createdAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set createdAt($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => clearField(7);
}

