/*
 * Copyright (c) 2023.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

package ctrl

import (
	"clog/ctrl/clog"
	"clog/ctrl/private"

	clog_svc "github.com/andypangaribuan/project9/proto/clog-svc"
)

var (
	CLogSvc clog_svc.CLogServiceServer
	Private *private.PrivateCtrl
)

func init() {
	CLogSvc = clog.Create(grpcContext)
	Private = new(private.PrivateCtrl)
}
