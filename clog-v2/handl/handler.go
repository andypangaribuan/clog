/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package handl

import (
	"clog/handl/clog"
	"clog/res/proto/generated/sclog"

	"github.com/andypangaribuan/gmod/gm"
)

var (
	Clog sclog.CLogServiceServer
)

func init() {
	gm.Util.SingleExec(initialize)
}

func initialize() {
	Clog = clog.ServiceServer()
}
