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
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'svcName', '3': 2, '4': 1, '5': 9, '10': 'svcName'},
    const {'1': 'svcParent', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'svcParent'},
    const {'1': 'message', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'message'},
    const {'1': 'severity', '3': 5, '4': 1, '5': 9, '10': 'severity'},
    const {'1': 'reqHeader', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'reqHeader'},
    const {'1': 'reqBody', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'reqBody'},
    const {'1': 'reqPar', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'reqPar'},
    const {'1': 'resData', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'resData'},
    const {'1': 'resCode', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Int32Value', '10': 'resCode'},
    const {'1': 'data', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'data'},
    const {'1': 'error', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'error'},
    const {'1': 'stackTrace', '3': 13, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'stackTrace'},
    const {'1': 'startAt', '3': 14, '4': 1, '5': 9, '10': 'startAt'},
    const {'1': 'finishAt', '3': 15, '4': 1, '5': 9, '10': 'finishAt'},
    const {'1': 'createdAt', '3': 16, '4': 1, '5': 9, '10': 'createdAt'},
  ],
};

/// Descriptor for `RequestServiceLog`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestServiceLogDescriptor = $convert.base64Decode('ChFSZXF1ZXN0U2VydmljZUxvZxIOCgJpZBgBIAEoCVICaWQSGAoHc3ZjTmFtZRgCIAEoCVIHc3ZjTmFtZRI6CglzdmNQYXJlbnQYAyABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSCXN2Y1BhcmVudBI2CgdtZXNzYWdlGAQgASgLMhwuZ29vZ2xlLnByb3RvYnVmLlN0cmluZ1ZhbHVlUgdtZXNzYWdlEhoKCHNldmVyaXR5GAUgASgJUghzZXZlcml0eRI6CglyZXFIZWFkZXIYBiABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSCXJlcUhlYWRlchI2CgdyZXFCb2R5GAcgASgLMhwuZ29vZ2xlLnByb3RvYnVmLlN0cmluZ1ZhbHVlUgdyZXFCb2R5EjQKBnJlcVBhchgIIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIGcmVxUGFyEjYKB3Jlc0RhdGEYCSABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSB3Jlc0RhdGESNQoHcmVzQ29kZRgKIAEoCzIbLmdvb2dsZS5wcm90b2J1Zi5JbnQzMlZhbHVlUgdyZXNDb2RlEjAKBGRhdGEYCyABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSBGRhdGESMgoFZXJyb3IYDCABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSBWVycm9yEjwKCnN0YWNrVHJhY2UYDSABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSCnN0YWNrVHJhY2USGAoHc3RhcnRBdBgOIAEoCVIHc3RhcnRBdBIaCghmaW5pc2hBdBgPIAEoCVIIZmluaXNoQXQSHAoJY3JlYXRlZEF0GBAgASgJUgljcmVhdGVkQXQ=');
@$core.Deprecated('Use requestInfoLogDescriptor instead')
const RequestInfoLog$json = const {
  '1': 'RequestInfoLog',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'svcName', '3': 2, '4': 1, '5': 9, '10': 'svcName'},
    const {'1': 'svcParent', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'svcParent'},
    const {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'severity', '3': 5, '4': 1, '5': 9, '10': 'severity'},
    const {'1': 'data', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'data'},
    const {'1': 'createdAt', '3': 7, '4': 1, '5': 9, '10': 'createdAt'},
  ],
};

/// Descriptor for `RequestInfoLog`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestInfoLogDescriptor = $convert.base64Decode('Cg5SZXF1ZXN0SW5mb0xvZxIOCgJpZBgBIAEoCVICaWQSGAoHc3ZjTmFtZRgCIAEoCVIHc3ZjTmFtZRI6CglzdmNQYXJlbnQYAyABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSCXN2Y1BhcmVudBIYCgdtZXNzYWdlGAQgASgJUgdtZXNzYWdlEhoKCHNldmVyaXR5GAUgASgJUghzZXZlcml0eRIwCgRkYXRhGAYgASgLMhwuZ29vZ2xlLnByb3RvYnVmLlN0cmluZ1ZhbHVlUgRkYXRhEhwKCWNyZWF0ZWRBdBgHIAEoCVIJY3JlYXRlZEF0');
