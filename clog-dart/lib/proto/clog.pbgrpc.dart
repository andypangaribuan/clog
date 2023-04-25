///
//  Generated code. Do not modify.
//  source: clog.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'clog.pb.dart' as $0;
export 'clog.pb.dart';

class CLogServiceClient extends $grpc.Client {
  static final _$serviceLog =
      $grpc.ClientMethod<$0.RequestServiceLog, $0.Response>(
          '/clog_svc.CLogService/ServiceLog',
          ($0.RequestServiceLog value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$infoLog = $grpc.ClientMethod<$0.RequestInfoLog, $0.Response>(
      '/clog_svc.CLogService/InfoLog',
      ($0.RequestInfoLog value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$dbqLog = $grpc.ClientMethod<$0.RequestDbqLog, $0.Response>(
      '/clog_svc.CLogService/DbqLog',
      ($0.RequestDbqLog value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));

  CLogServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Response> serviceLog($0.RequestServiceLog request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$serviceLog, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> infoLog($0.RequestInfoLog request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$infoLog, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> dbqLog($0.RequestDbqLog request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dbqLog, request, options: options);
  }
}

abstract class CLogServiceBase extends $grpc.Service {
  $core.String get $name => 'clog_svc.CLogService';

  CLogServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RequestServiceLog, $0.Response>(
        'ServiceLog',
        serviceLog_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestServiceLog.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestInfoLog, $0.Response>(
        'InfoLog',
        infoLog_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestInfoLog.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestDbqLog, $0.Response>(
        'DbqLog',
        dbqLog_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestDbqLog.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
  }

  $async.Future<$0.Response> serviceLog_Pre($grpc.ServiceCall call,
      $async.Future<$0.RequestServiceLog> request) async {
    return serviceLog(call, await request);
  }

  $async.Future<$0.Response> infoLog_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RequestInfoLog> request) async {
    return infoLog(call, await request);
  }

  $async.Future<$0.Response> dbqLog_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RequestDbqLog> request) async {
    return dbqLog(call, await request);
  }

  $async.Future<$0.Response> serviceLog(
      $grpc.ServiceCall call, $0.RequestServiceLog request);
  $async.Future<$0.Response> infoLog(
      $grpc.ServiceCall call, $0.RequestInfoLog request);
  $async.Future<$0.Response> dbqLog(
      $grpc.ServiceCall call, $0.RequestDbqLog request);
}
