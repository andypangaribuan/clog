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
	maxText = 10000
	v500    = 500
	v1k     = 1000
	v2k     = 2000
)

func trim(val string, max int) string {
	if len(val) <= max {
		return val
	}
	return val[:max]
}

func trimInternal(e *entity.Internal) *entity.Internal {
	e.ExecPath = trim(e.ExecPath, v500)
	e.ExecFunction = trim(e.ExecFunction, v500)
	e.Data = trim(e.Data, maxText)
	e.ErrorMessage = trim(e.ErrorMessage, v1k)
	e.StackTrace = trim(e.StackTrace, maxText)
	return e
}
