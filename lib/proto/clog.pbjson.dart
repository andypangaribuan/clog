///
//  Generated code. Do not modify.
//  source: clog.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use responseDescriptor instead')
const Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode('CghSZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdl');
@$core.Deprecated('Use requestServiceLogDescriptor instead')
const RequestServiceLog$json = const {
  '1': 'RequestServiceLog',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'userId'},
    const {'1': 'partnerId', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'partnerId'},
    const {'1': 'xid', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'xid'},
    const {'1': 'svcName', '3': 5, '4': 1, '5': 9, '10': 'svcName'},
    const {'1': 'svcVersion', '3': 6, '4': 1, '5': 9, '10': 'svcVersion'},
    const {'1': 'svcParent', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'svcParent'},
    const {'1': 'endpoint', '3': 8, '4': 1, '5': 9, '10': 'endpoint'},
    const {'1': 'version', '3': 9, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'message', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'message'},
    const {'1': 'severity', '3': 11, '4': 1, '5': 9, '10': 'severity'},
    const {'1': 'path', '3': 12, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'function', '3': 13, '4': 1, '5': 9, '10': 'function'},
    const {'1': 'reqHeader', '3': 14, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'reqHeader'},
    const {'1': 'reqBody', '3': 15, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'reqBody'},
    const {'1': 'reqParam', '3': 16, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'reqParam'},
    const {'1': 'resData', '3': 17, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'resData'},
    const {'1': 'resCode', '3': 18, '4': 1, '5': 11, '6': '.google.protobuf.Int32Value', '10': 'resCode'},
    const {'1': 'data', '3': 19, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'data'},
    const {'1': 'error', '3': 20, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'error'},
    const {'1': 'stackTrace', '3': 21, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'stackTrace'},
    const {'1': 'clientIP', '3': 22, '4': 1, '5': 9, '10': 'clientIP'},
    const {'1': 'startAt', '3': 23, '4': 1, '5': 9, '10': 'startAt'},
    const {'1': 'finishAt', '3': 24, '4': 1, '5': 9, '10': 'finishAt'},
    const {'1': 'createdAt', '3': 25, '4': 1, '5': 9, '10': 'createdAt'},
  ],
};

/// Descriptor for `RequestServiceLog`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestServiceLogDescriptor = $convert.base64Decode('ChFSZXF1ZXN0U2VydmljZUxvZxIQCgN1aWQYASABKAlSA3VpZBI0CgZ1c2VySWQYAiABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSBnVzZXJJZBI6CglwYXJ0bmVySWQYAyABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSCXBhcnRuZXJJZBIuCgN4aWQYBCABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSA3hpZBIYCgdzdmNOYW1lGAUgASgJUgdzdmNOYW1lEh4KCnN2Y1ZlcnNpb24YBiABKAlSCnN2Y1ZlcnNpb24SOgoJc3ZjUGFyZW50GAcgASgLMhwuZ29vZ2xlLnByb3RvYnVmLlN0cmluZ1ZhbHVlUglzdmNQYXJlbnQSGgoIZW5kcG9pbnQYCCABKAlSCGVuZHBvaW50EhgKB3ZlcnNpb24YCSABKAlSB3ZlcnNpb24SNgoHbWVzc2FnZRgKIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIHbWVzc2FnZRIaCghzZXZlcml0eRgLIAEoCVIIc2V2ZXJpdHkSEgoEcGF0aBgMIAEoCVIEcGF0aBIaCghmdW5jdGlvbhgNIAEoCVIIZnVuY3Rpb24SOgoJcmVxSGVhZGVyGA4gASgLMhwuZ29vZ2xlLnByb3RvYnVmLlN0cmluZ1ZhbHVlUglyZXFIZWFkZXISNgoHcmVxQm9keRgPIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIHcmVxQm9keRI4CghyZXFQYXJhbRgQIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIIcmVxUGFyYW0SNgoHcmVzRGF0YRgRIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIHcmVzRGF0YRI1CgdyZXNDb2RlGBIgASgLMhsuZ29vZ2xlLnByb3RvYnVmLkludDMyVmFsdWVSB3Jlc0NvZGUSMAoEZGF0YRgTIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIEZGF0YRIyCgVlcnJvchgUIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIFZXJyb3ISPAoKc3RhY2tUcmFjZRgVIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIKc3RhY2tUcmFjZRIaCghjbGllbnRJUBgWIAEoCVIIY2xpZW50SVASGAoHc3RhcnRBdBgXIAEoCVIHc3RhcnRBdBIaCghmaW5pc2hBdBgYIAEoCVIIZmluaXNoQXQSHAoJY3JlYXRlZEF0GBkgASgJUgljcmVhdGVkQXQ=');
@$core.Deprecated('Use requestInfoLogDescriptor instead')
const RequestInfoLog$json = const {
  '1': 'RequestInfoLog',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'userId'},
    const {'1': 'partnerId', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'partnerId'},
    const {'1': 'xid', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'xid'},
    const {'1': 'svcName', '3': 5, '4': 1, '5': 9, '10': 'svcName'},
    const {'1': 'svcVersion', '3': 6, '4': 1, '5': 9, '10': 'svcVersion'},
    const {'1': 'svcParent', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'svcParent'},
    const {'1': 'message', '3': 8, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'severity', '3': 9, '4': 1, '5': 9, '10': 'severity'},
    const {'1': 'path', '3': 10, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'function', '3': 11, '4': 1, '5': 9, '10': 'function'},
    const {'1': 'data', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'data'},
    const {'1': 'createdAt', '3': 13, '4': 1, '5': 9, '10': 'createdAt'},
  ],
};

/// Descriptor for `RequestInfoLog`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestInfoLogDescriptor = $convert.base64Decode('Cg5SZXF1ZXN0SW5mb0xvZxIQCgN1aWQYASABKAlSA3VpZBI0CgZ1c2VySWQYAiABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSBnVzZXJJZBI6CglwYXJ0bmVySWQYAyABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSCXBhcnRuZXJJZBIuCgN4aWQYBCABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSA3hpZBIYCgdzdmNOYW1lGAUgASgJUgdzdmNOYW1lEh4KCnN2Y1ZlcnNpb24YBiABKAlSCnN2Y1ZlcnNpb24SOgoJc3ZjUGFyZW50GAcgASgLMhwuZ29vZ2xlLnByb3RvYnVmLlN0cmluZ1ZhbHVlUglzdmNQYXJlbnQSGAoHbWVzc2FnZRgIIAEoCVIHbWVzc2FnZRIaCghzZXZlcml0eRgJIAEoCVIIc2V2ZXJpdHkSEgoEcGF0aBgKIAEoCVIEcGF0aBIaCghmdW5jdGlvbhgLIAEoCVIIZnVuY3Rpb24SMAoEZGF0YRgMIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIEZGF0YRIcCgljcmVhdGVkQXQYDSABKAlSCWNyZWF0ZWRBdA==');
@$core.Deprecated('Use requestDbqLogDescriptor instead')
const RequestDbqLog$json = const {
  '1': 'RequestDbqLog',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'userId'},
    const {'1': 'partnerId', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'partnerId'},
    const {'1': 'xid', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'xid'},
    const {'1': 'svcName', '3': 5, '4': 1, '5': 9, '10': 'svcName'},
    const {'1': 'svcVersion', '3': 6, '4': 1, '5': 9, '10': 'svcVersion'},
    const {'1': 'svcParent', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'svcParent'},
    const {'1': 'sqlQuery', '3': 8, '4': 1, '5': 9, '10': 'sqlQuery'},
    const {'1': 'sqlPars', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'sqlPars'},
    const {'1': 'severity', '3': 10, '4': 1, '5': 9, '10': 'severity'},
    const {'1': 'path', '3': 11, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'function', '3': 12, '4': 1, '5': 9, '10': 'function'},
    const {'1': 'error', '3': 13, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'error'},
    const {'1': 'stackTrace', '3': 14, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'stackTrace'},
    const {'1': 'startAt', '3': 15, '4': 1, '5': 9, '10': 'startAt'},
    const {'1': 'finishAt', '3': 16, '4': 1, '5': 9, '10': 'finishAt'},
    const {'1': 'createdAt', '3': 17, '4': 1, '5': 9, '10': 'createdAt'},
  ],
};

/// Descriptor for `RequestDbqLog`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDbqLogDescriptor = $convert.base64Decode('Cg1SZXF1ZXN0RGJxTG9nEhAKA3VpZBgBIAEoCVIDdWlkEjQKBnVzZXJJZBgCIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIGdXNlcklkEjoKCXBhcnRuZXJJZBgDIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIJcGFydG5lcklkEi4KA3hpZBgEIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIDeGlkEhgKB3N2Y05hbWUYBSABKAlSB3N2Y05hbWUSHgoKc3ZjVmVyc2lvbhgGIAEoCVIKc3ZjVmVyc2lvbhI6CglzdmNQYXJlbnQYByABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSCXN2Y1BhcmVudBIaCghzcWxRdWVyeRgIIAEoCVIIc3FsUXVlcnkSNgoHc3FsUGFycxgJIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIHc3FsUGFycxIaCghzZXZlcml0eRgKIAEoCVIIc2V2ZXJpdHkSEgoEcGF0aBgLIAEoCVIEcGF0aBIaCghmdW5jdGlvbhgMIAEoCVIIZnVuY3Rpb24SMgoFZXJyb3IYDSABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSBWVycm9yEjwKCnN0YWNrVHJhY2UYDiABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSCnN0YWNrVHJhY2USGAoHc3RhcnRBdBgPIAEoCVIHc3RhcnRBdBIaCghmaW5pc2hBdBgQIAEoCVIIZmluaXNoQXQSHAoJY3JlYXRlZEF0GBEgASgJUgljcmVhdGVkQXQ=');
