/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

package clog

import "clog/db/entity"

const (
	l500 = 500
	l1k  = 1000
	l2k  = 2000
	lMax = 10000
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

func trimServiceLog(e *entity.ServiceLog) *entity.ServiceLog {
	e.Endpoint = trim(e.Endpoint, l500)
	e.Message = ptrTrim(e.Message, l2k)
	e.Path = trim(e.Path, l1k)
	e.Function = trim(e.Function, l1k)
	e.ReqHeader = ptrTrim(e.ReqHeader, lMax)
	e.ReqBody = ptrTrim(e.ReqBody, lMax)
	e.ReqPar = ptrTrim(e.ReqPar, lMax)
	e.ResData = ptrTrim(e.ResData, lMax)
	e.Data = ptrTrim(e.Data, lMax)
	e.Error = ptrTrim(e.Error, l1k)
	e.StackTrace = ptrTrim(e.StackTrace, lMax)
	return e
}

func trimDbqLog(e *entity.DbqLog) *entity.DbqLog {
	e.SqlQuery = trim(e.SqlQuery, lMax)
	e.SqlPars = ptrTrim(e.SqlPars, lMax)
	e.Path = trim(e.Path, l1k)
	e.Function = trim(e.Function, l1k)
	e.Error = ptrTrim(e.Error, lMax)
	e.StackTrace = ptrTrim(e.StackTrace, lMax)
	return e
}

func trimInfoLog(e *entity.InfoLog) *entity.InfoLog {
	e.Message = trim(e.Message, l1k)
	e.Path = trim(e.Path, l1k)
	e.Function = trim(e.Function, l1k)
	e.Data = ptrTrim(e.Data, lMax)
	return e
}
