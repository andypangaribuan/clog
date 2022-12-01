//
// Copyright (c) 2022.
// Created by Andy Pangaribuan. All Rights Reserved.
//
// This product is protected by copyright and distributed under
// licenses restricting copying, distribution and decompilation.

// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.1
// 	protoc        v3.21.4
// source: proto/clog.proto

package clog

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	wrapperspb "google.golang.org/protobuf/types/known/wrapperspb"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type Response struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Status  string `protobuf:"bytes,1,opt,name=status,proto3" json:"status,omitempty"`
	Message string `protobuf:"bytes,2,opt,name=message,proto3" json:"message,omitempty"`
}

func (x *Response) Reset() {
	*x = Response{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_clog_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Response) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Response) ProtoMessage() {}

func (x *Response) ProtoReflect() protoreflect.Message {
	mi := &file_proto_clog_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Response.ProtoReflect.Descriptor instead.
func (*Response) Descriptor() ([]byte, []int) {
	return file_proto_clog_proto_rawDescGZIP(), []int{0}
}

func (x *Response) GetStatus() string {
	if x != nil {
		return x.Status
	}
	return ""
}

func (x *Response) GetMessage() string {
	if x != nil {
		return x.Message
	}
	return ""
}

type RequestServiceLog struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id         string                  `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
	SvcName    string                  `protobuf:"bytes,2,opt,name=svcName,proto3" json:"svcName,omitempty"`
	SvcParent  *wrapperspb.StringValue `protobuf:"bytes,3,opt,name=svcParent,proto3" json:"svcParent,omitempty"`
	Message    *wrapperspb.StringValue `protobuf:"bytes,4,opt,name=message,proto3" json:"message,omitempty"`
	Severity   string                  `protobuf:"bytes,5,opt,name=severity,proto3" json:"severity,omitempty"`
	ReqHeader  *wrapperspb.StringValue `protobuf:"bytes,6,opt,name=reqHeader,proto3" json:"reqHeader,omitempty"`
	ReqBody    *wrapperspb.StringValue `protobuf:"bytes,7,opt,name=reqBody,proto3" json:"reqBody,omitempty"`
	ReqPar     *wrapperspb.StringValue `protobuf:"bytes,8,opt,name=reqPar,proto3" json:"reqPar,omitempty"`
	ResData    *wrapperspb.StringValue `protobuf:"bytes,9,opt,name=resData,proto3" json:"resData,omitempty"`
	ResCode    *wrapperspb.Int32Value  `protobuf:"bytes,10,opt,name=resCode,proto3" json:"resCode,omitempty"`
	Data       *wrapperspb.StringValue `protobuf:"bytes,11,opt,name=data,proto3" json:"data,omitempty"`
	Error      *wrapperspb.StringValue `protobuf:"bytes,12,opt,name=error,proto3" json:"error,omitempty"`
	StackTrace *wrapperspb.StringValue `protobuf:"bytes,13,opt,name=stackTrace,proto3" json:"stackTrace,omitempty"`
	StartAt    string                  `protobuf:"bytes,14,opt,name=startAt,proto3" json:"startAt,omitempty"`     // RFC33389 Milli
	FinishAt   string                  `protobuf:"bytes,15,opt,name=finishAt,proto3" json:"finishAt,omitempty"`   // RFC33389 Milli
	CreatedAt  string                  `protobuf:"bytes,16,opt,name=createdAt,proto3" json:"createdAt,omitempty"` // RFC33389 Milli
}

func (x *RequestServiceLog) Reset() {
	*x = RequestServiceLog{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_clog_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *RequestServiceLog) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*RequestServiceLog) ProtoMessage() {}

func (x *RequestServiceLog) ProtoReflect() protoreflect.Message {
	mi := &file_proto_clog_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use RequestServiceLog.ProtoReflect.Descriptor instead.
func (*RequestServiceLog) Descriptor() ([]byte, []int) {
	return file_proto_clog_proto_rawDescGZIP(), []int{1}
}

func (x *RequestServiceLog) GetId() string {
	if x != nil {
		return x.Id
	}
	return ""
}

func (x *RequestServiceLog) GetSvcName() string {
	if x != nil {
		return x.SvcName
	}
	return ""
}

func (x *RequestServiceLog) GetSvcParent() *wrapperspb.StringValue {
	if x != nil {
		return x.SvcParent
	}
	return nil
}

func (x *RequestServiceLog) GetMessage() *wrapperspb.StringValue {
	if x != nil {
		return x.Message
	}
	return nil
}

func (x *RequestServiceLog) GetSeverity() string {
	if x != nil {
		return x.Severity
	}
	return ""
}

func (x *RequestServiceLog) GetReqHeader() *wrapperspb.StringValue {
	if x != nil {
		return x.ReqHeader
	}
	return nil
}

func (x *RequestServiceLog) GetReqBody() *wrapperspb.StringValue {
	if x != nil {
		return x.ReqBody
	}
	return nil
}

func (x *RequestServiceLog) GetReqPar() *wrapperspb.StringValue {
	if x != nil {
		return x.ReqPar
	}
	return nil
}

func (x *RequestServiceLog) GetResData() *wrapperspb.StringValue {
	if x != nil {
		return x.ResData
	}
	return nil
}

func (x *RequestServiceLog) GetResCode() *wrapperspb.Int32Value {
	if x != nil {
		return x.ResCode
	}
	return nil
}

func (x *RequestServiceLog) GetData() *wrapperspb.StringValue {
	if x != nil {
		return x.Data
	}
	return nil
}

func (x *RequestServiceLog) GetError() *wrapperspb.StringValue {
	if x != nil {
		return x.Error
	}
	return nil
}

func (x *RequestServiceLog) GetStackTrace() *wrapperspb.StringValue {
	if x != nil {
		return x.StackTrace
	}
	return nil
}

func (x *RequestServiceLog) GetStartAt() string {
	if x != nil {
		return x.StartAt
	}
	return ""
}

func (x *RequestServiceLog) GetFinishAt() string {
	if x != nil {
		return x.FinishAt
	}
	return ""
}

func (x *RequestServiceLog) GetCreatedAt() string {
	if x != nil {
		return x.CreatedAt
	}
	return ""
}

type RequestInfoLog struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id        string                  `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
	SvcName   string                  `protobuf:"bytes,2,opt,name=svcName,proto3" json:"svcName,omitempty"`
	SvcParent *wrapperspb.StringValue `protobuf:"bytes,3,opt,name=svcParent,proto3" json:"svcParent,omitempty"`
	Message   string                  `protobuf:"bytes,4,opt,name=message,proto3" json:"message,omitempty"`
	Severity  string                  `protobuf:"bytes,5,opt,name=severity,proto3" json:"severity,omitempty"`
	Data      *wrapperspb.StringValue `protobuf:"bytes,6,opt,name=data,proto3" json:"data,omitempty"`
	CreatedAt string                  `protobuf:"bytes,7,opt,name=createdAt,proto3" json:"createdAt,omitempty"` // RFC33389 Milli
}

func (x *RequestInfoLog) Reset() {
	*x = RequestInfoLog{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_clog_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *RequestInfoLog) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*RequestInfoLog) ProtoMessage() {}

func (x *RequestInfoLog) ProtoReflect() protoreflect.Message {
	mi := &file_proto_clog_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use RequestInfoLog.ProtoReflect.Descriptor instead.
func (*RequestInfoLog) Descriptor() ([]byte, []int) {
	return file_proto_clog_proto_rawDescGZIP(), []int{2}
}

func (x *RequestInfoLog) GetId() string {
	if x != nil {
		return x.Id
	}
	return ""
}

func (x *RequestInfoLog) GetSvcName() string {
	if x != nil {
		return x.SvcName
	}
	return ""
}

func (x *RequestInfoLog) GetSvcParent() *wrapperspb.StringValue {
	if x != nil {
		return x.SvcParent
	}
	return nil
}

func (x *RequestInfoLog) GetMessage() string {
	if x != nil {
		return x.Message
	}
	return ""
}

func (x *RequestInfoLog) GetSeverity() string {
	if x != nil {
		return x.Severity
	}
	return ""
}

func (x *RequestInfoLog) GetData() *wrapperspb.StringValue {
	if x != nil {
		return x.Data
	}
	return nil
}

func (x *RequestInfoLog) GetCreatedAt() string {
	if x != nil {
		return x.CreatedAt
	}
	return ""
}

var File_proto_clog_proto protoreflect.FileDescriptor

var file_proto_clog_proto_rawDesc = []byte{
	0x0a, 0x10, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2f, 0x63, 0x6c, 0x6f, 0x67, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x12, 0x04, 0x63, 0x6c, 0x6f, 0x67, 0x1a, 0x1e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65,
	0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2f, 0x77, 0x72, 0x61, 0x70, 0x70, 0x65,
	0x72, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x3c, 0x0a, 0x08, 0x52, 0x65, 0x73, 0x70,
	0x6f, 0x6e, 0x73, 0x65, 0x12, 0x16, 0x0a, 0x06, 0x73, 0x74, 0x61, 0x74, 0x75, 0x73, 0x18, 0x01,
	0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x73, 0x74, 0x61, 0x74, 0x75, 0x73, 0x12, 0x18, 0x0a, 0x07,
	0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x6d,
	0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x22, 0xde, 0x05, 0x0a, 0x11, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x4c, 0x6f, 0x67, 0x12, 0x0e, 0x0a, 0x02,
	0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x02, 0x69, 0x64, 0x12, 0x18, 0x0a, 0x07,
	0x73, 0x76, 0x63, 0x4e, 0x61, 0x6d, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x73,
	0x76, 0x63, 0x4e, 0x61, 0x6d, 0x65, 0x12, 0x3a, 0x0a, 0x09, 0x73, 0x76, 0x63, 0x50, 0x61, 0x72,
	0x65, 0x6e, 0x74, 0x18, 0x03, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1c, 0x2e, 0x67, 0x6f, 0x6f, 0x67,
	0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x53, 0x74, 0x72, 0x69,
	0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x52, 0x09, 0x73, 0x76, 0x63, 0x50, 0x61, 0x72, 0x65,
	0x6e, 0x74, 0x12, 0x36, 0x0a, 0x07, 0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x18, 0x04, 0x20,
	0x01, 0x28, 0x0b, 0x32, 0x1c, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x53, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75,
	0x65, 0x52, 0x07, 0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x12, 0x1a, 0x0a, 0x08, 0x73, 0x65,
	0x76, 0x65, 0x72, 0x69, 0x74, 0x79, 0x18, 0x05, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x73, 0x65,
	0x76, 0x65, 0x72, 0x69, 0x74, 0x79, 0x12, 0x3a, 0x0a, 0x09, 0x72, 0x65, 0x71, 0x48, 0x65, 0x61,
	0x64, 0x65, 0x72, 0x18, 0x06, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1c, 0x2e, 0x67, 0x6f, 0x6f, 0x67,
	0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x53, 0x74, 0x72, 0x69,
	0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x52, 0x09, 0x72, 0x65, 0x71, 0x48, 0x65, 0x61, 0x64,
	0x65, 0x72, 0x12, 0x36, 0x0a, 0x07, 0x72, 0x65, 0x71, 0x42, 0x6f, 0x64, 0x79, 0x18, 0x07, 0x20,
	0x01, 0x28, 0x0b, 0x32, 0x1c, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x53, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75,
	0x65, 0x52, 0x07, 0x72, 0x65, 0x71, 0x42, 0x6f, 0x64, 0x79, 0x12, 0x34, 0x0a, 0x06, 0x72, 0x65,
	0x71, 0x50, 0x61, 0x72, 0x18, 0x08, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1c, 0x2e, 0x67, 0x6f, 0x6f,
	0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x53, 0x74, 0x72,
	0x69, 0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x52, 0x06, 0x72, 0x65, 0x71, 0x50, 0x61, 0x72,
	0x12, 0x36, 0x0a, 0x07, 0x72, 0x65, 0x73, 0x44, 0x61, 0x74, 0x61, 0x18, 0x09, 0x20, 0x01, 0x28,
	0x0b, 0x32, 0x1c, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f,
	0x62, 0x75, 0x66, 0x2e, 0x53, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x52,
	0x07, 0x72, 0x65, 0x73, 0x44, 0x61, 0x74, 0x61, 0x12, 0x35, 0x0a, 0x07, 0x72, 0x65, 0x73, 0x43,
	0x6f, 0x64, 0x65, 0x18, 0x0a, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1b, 0x2e, 0x67, 0x6f, 0x6f, 0x67,
	0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x49, 0x6e, 0x74, 0x33,
	0x32, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x52, 0x07, 0x72, 0x65, 0x73, 0x43, 0x6f, 0x64, 0x65, 0x12,
	0x30, 0x0a, 0x04, 0x64, 0x61, 0x74, 0x61, 0x18, 0x0b, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1c, 0x2e,
	0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e,
	0x53, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x52, 0x04, 0x64, 0x61, 0x74,
	0x61, 0x12, 0x32, 0x0a, 0x05, 0x65, 0x72, 0x72, 0x6f, 0x72, 0x18, 0x0c, 0x20, 0x01, 0x28, 0x0b,
	0x32, 0x1c, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62,
	0x75, 0x66, 0x2e, 0x53, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x52, 0x05,
	0x65, 0x72, 0x72, 0x6f, 0x72, 0x12, 0x3c, 0x0a, 0x0a, 0x73, 0x74, 0x61, 0x63, 0x6b, 0x54, 0x72,
	0x61, 0x63, 0x65, 0x18, 0x0d, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1c, 0x2e, 0x67, 0x6f, 0x6f, 0x67,
	0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x53, 0x74, 0x72, 0x69,
	0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x52, 0x0a, 0x73, 0x74, 0x61, 0x63, 0x6b, 0x54, 0x72,
	0x61, 0x63, 0x65, 0x12, 0x18, 0x0a, 0x07, 0x73, 0x74, 0x61, 0x72, 0x74, 0x41, 0x74, 0x18, 0x0e,
	0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x73, 0x74, 0x61, 0x72, 0x74, 0x41, 0x74, 0x12, 0x1a, 0x0a,
	0x08, 0x66, 0x69, 0x6e, 0x69, 0x73, 0x68, 0x41, 0x74, 0x18, 0x0f, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x08, 0x66, 0x69, 0x6e, 0x69, 0x73, 0x68, 0x41, 0x74, 0x12, 0x1c, 0x0a, 0x09, 0x63, 0x72, 0x65,
	0x61, 0x74, 0x65, 0x64, 0x41, 0x74, 0x18, 0x10, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x63, 0x72,
	0x65, 0x61, 0x74, 0x65, 0x64, 0x41, 0x74, 0x22, 0xfc, 0x01, 0x0a, 0x0e, 0x52, 0x65, 0x71, 0x75,
	0x65, 0x73, 0x74, 0x49, 0x6e, 0x66, 0x6f, 0x4c, 0x6f, 0x67, 0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x02, 0x69, 0x64, 0x12, 0x18, 0x0a, 0x07, 0x73, 0x76,
	0x63, 0x4e, 0x61, 0x6d, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x73, 0x76, 0x63,
	0x4e, 0x61, 0x6d, 0x65, 0x12, 0x3a, 0x0a, 0x09, 0x73, 0x76, 0x63, 0x50, 0x61, 0x72, 0x65, 0x6e,
	0x74, 0x18, 0x03, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1c, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x53, 0x74, 0x72, 0x69, 0x6e, 0x67,
	0x56, 0x61, 0x6c, 0x75, 0x65, 0x52, 0x09, 0x73, 0x76, 0x63, 0x50, 0x61, 0x72, 0x65, 0x6e, 0x74,
	0x12, 0x18, 0x0a, 0x07, 0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x18, 0x04, 0x20, 0x01, 0x28,
	0x09, 0x52, 0x07, 0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x12, 0x1a, 0x0a, 0x08, 0x73, 0x65,
	0x76, 0x65, 0x72, 0x69, 0x74, 0x79, 0x18, 0x05, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x73, 0x65,
	0x76, 0x65, 0x72, 0x69, 0x74, 0x79, 0x12, 0x30, 0x0a, 0x04, 0x64, 0x61, 0x74, 0x61, 0x18, 0x06,
	0x20, 0x01, 0x28, 0x0b, 0x32, 0x1c, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x53, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x56, 0x61, 0x6c,
	0x75, 0x65, 0x52, 0x04, 0x64, 0x61, 0x74, 0x61, 0x12, 0x1c, 0x0a, 0x09, 0x63, 0x72, 0x65, 0x61,
	0x74, 0x65, 0x64, 0x41, 0x74, 0x18, 0x07, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x63, 0x72, 0x65,
	0x61, 0x74, 0x65, 0x64, 0x41, 0x74, 0x32, 0x75, 0x0a, 0x0b, 0x43, 0x4c, 0x6f, 0x67, 0x53, 0x65,
	0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x35, 0x0a, 0x0a, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65,
	0x4c, 0x6f, 0x67, 0x12, 0x17, 0x2e, 0x63, 0x6c, 0x6f, 0x67, 0x2e, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x4c, 0x6f, 0x67, 0x1a, 0x0e, 0x2e, 0x63,
	0x6c, 0x6f, 0x67, 0x2e, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x2f, 0x0a, 0x07,
	0x49, 0x6e, 0x66, 0x6f, 0x4c, 0x6f, 0x67, 0x12, 0x14, 0x2e, 0x63, 0x6c, 0x6f, 0x67, 0x2e, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x49, 0x6e, 0x66, 0x6f, 0x4c, 0x6f, 0x67, 0x1a, 0x0e, 0x2e,
	0x63, 0x6c, 0x6f, 0x67, 0x2e, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x42, 0x4c, 0x0a,
	0x1b, 0x69, 0x6f, 0x2e, 0x67, 0x72, 0x70, 0x63, 0x2e, 0x65, 0x78, 0x61, 0x6d, 0x70, 0x6c, 0x65,
	0x73, 0x2e, 0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x77, 0x6f, 0x72, 0x6c, 0x64, 0x42, 0x0f, 0x48, 0x65,
	0x6c, 0x6c, 0x6f, 0x57, 0x6f, 0x72, 0x6c, 0x64, 0x50, 0x72, 0x6f, 0x74, 0x6f, 0x50, 0x01, 0x5a,
	0x14, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2f, 0x67, 0x65, 0x6e, 0x65, 0x72, 0x61, 0x74, 0x65, 0x64,
	0x2f, 0x63, 0x6c, 0x6f, 0x67, 0xa2, 0x02, 0x03, 0x48, 0x4c, 0x57, 0x62, 0x06, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x33,
}

var (
	file_proto_clog_proto_rawDescOnce sync.Once
	file_proto_clog_proto_rawDescData = file_proto_clog_proto_rawDesc
)

func file_proto_clog_proto_rawDescGZIP() []byte {
	file_proto_clog_proto_rawDescOnce.Do(func() {
		file_proto_clog_proto_rawDescData = protoimpl.X.CompressGZIP(file_proto_clog_proto_rawDescData)
	})
	return file_proto_clog_proto_rawDescData
}

var file_proto_clog_proto_msgTypes = make([]protoimpl.MessageInfo, 3)
var file_proto_clog_proto_goTypes = []interface{}{
	(*Response)(nil),               // 0: clog.Response
	(*RequestServiceLog)(nil),      // 1: clog.RequestServiceLog
	(*RequestInfoLog)(nil),         // 2: clog.RequestInfoLog
	(*wrapperspb.StringValue)(nil), // 3: google.protobuf.StringValue
	(*wrapperspb.Int32Value)(nil),  // 4: google.protobuf.Int32Value
}
var file_proto_clog_proto_depIdxs = []int32{
	3,  // 0: clog.RequestServiceLog.svcParent:type_name -> google.protobuf.StringValue
	3,  // 1: clog.RequestServiceLog.message:type_name -> google.protobuf.StringValue
	3,  // 2: clog.RequestServiceLog.reqHeader:type_name -> google.protobuf.StringValue
	3,  // 3: clog.RequestServiceLog.reqBody:type_name -> google.protobuf.StringValue
	3,  // 4: clog.RequestServiceLog.reqPar:type_name -> google.protobuf.StringValue
	3,  // 5: clog.RequestServiceLog.resData:type_name -> google.protobuf.StringValue
	4,  // 6: clog.RequestServiceLog.resCode:type_name -> google.protobuf.Int32Value
	3,  // 7: clog.RequestServiceLog.data:type_name -> google.protobuf.StringValue
	3,  // 8: clog.RequestServiceLog.error:type_name -> google.protobuf.StringValue
	3,  // 9: clog.RequestServiceLog.stackTrace:type_name -> google.protobuf.StringValue
	3,  // 10: clog.RequestInfoLog.svcParent:type_name -> google.protobuf.StringValue
	3,  // 11: clog.RequestInfoLog.data:type_name -> google.protobuf.StringValue
	1,  // 12: clog.CLogService.ServiceLog:input_type -> clog.RequestServiceLog
	2,  // 13: clog.CLogService.InfoLog:input_type -> clog.RequestInfoLog
	0,  // 14: clog.CLogService.ServiceLog:output_type -> clog.Response
	0,  // 15: clog.CLogService.InfoLog:output_type -> clog.Response
	14, // [14:16] is the sub-list for method output_type
	12, // [12:14] is the sub-list for method input_type
	12, // [12:12] is the sub-list for extension type_name
	12, // [12:12] is the sub-list for extension extendee
	0,  // [0:12] is the sub-list for field type_name
}

func init() { file_proto_clog_proto_init() }
func file_proto_clog_proto_init() {
	if File_proto_clog_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_proto_clog_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Response); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_proto_clog_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*RequestServiceLog); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_proto_clog_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*RequestInfoLog); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_proto_clog_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   3,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_proto_clog_proto_goTypes,
		DependencyIndexes: file_proto_clog_proto_depIdxs,
		MessageInfos:      file_proto_clog_proto_msgTypes,
	}.Build()
	File_proto_clog_proto = out.File
	file_proto_clog_proto_rawDesc = nil
	file_proto_clog_proto_goTypes = nil
	file_proto_clog_proto_depIdxs = nil
}
