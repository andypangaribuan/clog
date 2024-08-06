/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package clog

import "clog/db/entity"

const (
	lMax = 10000
	l500 = 500
	l1k  = 1000
	l2k  = 2000
)

func trim(val string, maxLength int) string {
	if len(val) <= maxLength {
		return val
	}
	return val[:maxLength]
}

func ptrTrim(val *string, maxLength int) *string {
	if val == nil {
		return val
	}

	if len(*val) <= maxLength {
		return val
	}

	v := *val
	v = v[:maxLength]
	return &v
}

func trimInternal(e *entity.Internal) *entity.Internal {
	e.ExecPath = trim(e.ExecPath, l500)
	e.ExecFunction = trim(e.ExecFunction, l500)
	e.Data = trim(e.Data, lMax)
	e.ErrorMessage = trim(e.ErrorMessage, l1k)
	e.StackTrace = trim(e.StackTrace, lMax)
	return e
}

func trimNote(e *entity.Note) *entity.Note {
	e.ExecPath = trim(e.ExecPath, l500)
	e.ExecFunction = trim(e.ExecFunction, l500)
	e.Key = ptrTrim(e.Key, l500)
	e.SubKey = ptrTrim(e.SubKey, l500)
	e.Data = trim(e.Data, lMax)
	return e
}

func trimDbqV1(e *entity.DbqV1) *entity.DbqV1 {
	e.SqlQuery = trim(e.SqlQuery, lMax)
	e.SqlArgs = ptrTrim(e.SqlArgs, lMax)
	e.ExecPath = trim(e.ExecPath, l500)
	e.ExecFunction = trim(e.ExecFunction, l500)
	e.ErrorMessage = ptrTrim(e.ErrorMessage, l1k)
	e.StackTrace = ptrTrim(e.StackTrace, lMax)
	return e
}

func trimHttpCallV1(e *entity.HttpCallV1) *entity.HttpCallV1 {
	e.Url = trim(e.Url, l1k)
	e.ReqHeader = ptrTrim(e.ReqHeader, l2k)
	e.ReqParam = ptrTrim(e.ReqParam, l2k)
	e.ReqQuery = ptrTrim(e.ReqQuery, l2k)
	e.ReqForm = ptrTrim(e.ReqForm, l2k)
	e.ReqFiles = ptrTrim(e.ReqFiles, l2k)
	e.ReqBody = ptrTrim(e.ReqBody, lMax)
	e.ResData = ptrTrim(e.ResData, lMax)
	e.ErrorMessage = ptrTrim(e.ErrorMessage, l1k)
	e.StackTrace = ptrTrim(e.StackTrace, lMax)
	return e
}

func trimServicePieceV1(e *entity.ServicePieceV1) *entity.ServicePieceV1 {
	e.Endpoint = trim(e.Endpoint, l1k)
	e.Url = trim(e.Url, l1k)
	e.ReqHeader = ptrTrim(e.ReqHeader, l2k)
	e.ReqParam = ptrTrim(e.ReqParam, l2k)
	e.ReqQuery = ptrTrim(e.ReqQuery, l2k)
	e.ReqForm = ptrTrim(e.ReqForm, l2k)
	e.ReqBody = ptrTrim(e.ReqBody, lMax)
	return e
}

func trimServiceV1(e *entity.ServiceV1) *entity.ServiceV1 {
	e.Endpoint = trim(e.Endpoint, l1k)
	e.Url = trim(e.Url, l1k)
	e.ExecPath = trim(e.ExecPath, l500)
	e.ExecFunction = trim(e.ExecFunction, l500)
	e.ReqHeader = ptrTrim(e.ReqHeader, l2k)
	e.ReqParam = ptrTrim(e.ReqParam, l2k)
	e.ReqQuery = ptrTrim(e.ReqQuery, l2k)
	e.ReqForm = ptrTrim(e.ReqForm, l2k)
	e.ReqFiles = ptrTrim(e.ReqFiles, l2k)
	e.ReqBody = ptrTrim(e.ReqBody, lMax)
	e.ResData = ptrTrim(e.ResData, lMax)
	e.ErrorMessage = ptrTrim(e.ErrorMessage, l1k)
	e.StackTrace = ptrTrim(e.StackTrace, lMax)
	return e
}
