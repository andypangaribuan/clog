/*
 * Copyright (c) 2023.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

package clog

import (
	"clog/db/entity"
	"clog/db/repo"
	"context"
	"fmt"

	"github.com/andypangaribuan/project9/f9"
	"github.com/andypangaribuan/project9/p9"
	clog_svc "github.com/andypangaribuan/project9/proto/clog-svc"
)

func (slf *CLogCtrl) InfoLog(ctx context.Context, req *clog_svc.RequestInfoLog) (*clog_svc.Response, error) {
	createdAt, err := p9.Conv.Time.ToTimeRFC3339MilliSecond(req.CreatedAt)
	if err != nil {
		return slf.sendFailed(fmt.Sprintf("failed to convert created_at value as RFC3339 Millisecond time format, req data: %v", req.CreatedAt))
	}

	e := entity.InfoLog{
		Id:         slf.generateId(),
		Uid:        req.Uid,
		UserId:     f9.Val[string](req.UserId),
		PartnerId:  f9.Val[string](req.PartnerId),
		Xid:        f9.Val[string](req.Xid),
		SvcName:    req.SvcName,
		SvcVersion: req.SvcVersion,
		SvcParent:  f9.Val[string](req.SvcParent),
		Message:    req.Message,
		Severity:   req.Severity,
		Path:       req.Path,
		Function:   req.Function,
		Data:       f9.Val[string](req.Data),
		CreatedAt:  createdAt,
	}

	err = repo.InfoLog.Insert(e)
	if err != nil {
		return slf.sendFailed(fmt.Sprintf("%+v", err))
	}

	return slf.sendSuccess()
}
