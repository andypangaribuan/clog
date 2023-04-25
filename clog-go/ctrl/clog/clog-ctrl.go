/*
 * Copyright (c) 2023.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

package clog

import (
	"clog/abs"
	"fmt"

	"github.com/andypangaribuan/project9/f9"
	"github.com/andypangaribuan/project9/p9"
	clog_svc "github.com/andypangaribuan/project9/proto/clog-svc"
)

type CLogCtrl struct {
	clog_svc.UnimplementedCLogServiceServer
	gtx     abs.GRPCContext
	message *srMessage
}

type srMessage struct {
	statusSuccess      string
	statusFailed       string
	errNullRequestData string
	errInternalService string
}

func Create(gtx abs.GRPCContext) *CLogCtrl {
	return &CLogCtrl{
		gtx: gtx,
		message: &srMessage{
			statusSuccess:      "success",
			statusFailed:       "failed",
			errNullRequestData: "null request data",
			errInternalService: "internal service error",
		},
	}
}

func (slf *CLogCtrl) generateId() string {
	return fmt.Sprintf("%v%v", f9.TimeNow().UnixMicro(), p9.Util.GetNanoID(9))
}

func (slf *CLogCtrl) sendSuccess() (*clog_svc.Response, error) {
	res := &clog_svc.Response{
		Status: slf.message.statusSuccess,
	}

	return res, nil
}

func (slf *CLogCtrl) sendFailed(message string) (*clog_svc.Response, error) {
	res := &clog_svc.Response{
		Status:  slf.message.statusFailed,
		Message: message,
	}

	return res, nil
}
