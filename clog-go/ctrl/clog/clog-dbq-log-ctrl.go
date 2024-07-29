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
	"strconv"
	"time"

	"github.com/andypangaribuan/project9/f9"
	"github.com/andypangaribuan/project9/p9"
	clog_svc "github.com/andypangaribuan/project9/proto/clog-svc"
)

func (slf *CLogCtrl) DbqLog(ctx context.Context, req *clog_svc.RequestDbqLog) (*clog_svc.Response, error) {
	startAt, err := p9.Conv.Time.ToTimeRFC3339MilliSecond(req.StartAt)
	if err != nil {
		return slf.sendFailed(fmt.Sprintf("failed to convert start_at value as RFC3339 Millisecond time format, req data: %v", req.StartAt))
	}

	finishAt, err := p9.Conv.Time.ToTimeRFC3339MilliSecond(req.FinishAt)
	if err != nil {
		return slf.sendFailed(fmt.Sprintf("failed to convert finish_at value as RFC3339 Millisecond time format, req data: %v", req.FinishAt))
	}

	createdAt, err := p9.Conv.Time.ToTimeRFC3339MilliSecond(req.CreatedAt)
	if err != nil {
		return slf.sendFailed(fmt.Sprintf("failed to convert created_at value as RFC3339 Millisecond time format, req data: %v", req.CreatedAt))
	}

	microStr, err := p9.Util.GetRandom(3, "1234567890")
	if err == nil {
		microInt, err := strconv.Atoi(microStr)
		if err == nil {
			createdAt = createdAt.Add(time.Microsecond * time.Duration(microInt))
		}
	}

	durationMs := finishAt.Sub(startAt).Milliseconds()
	if durationMs < 0 {
		durationMs *= -1
	}

	e := entity.DbqLog{
		Id:         slf.generateId(),
		Uid:        req.Uid,
		UserId:     f9.Val[string](req.UserId),
		PartnerId:  f9.Val[string](req.PartnerId),
		Xid:        f9.Val[string](req.Xid),
		SvcName:    req.SvcName,
		SvcVersion: req.SvcVersion,
		SvcParent:  f9.Val[string](req.SvcParent),
		SqlQuery:   req.SqlQuery,
		SqlPars:    f9.Val[string](req.SqlPars),
		Severity:   req.Severity,
		Path:       req.Path,
		Function:   req.Function,
		Error:      f9.Val[string](req.Error),
		StackTrace: f9.Val[string](req.StackTrace),
		DurationMs: int(durationMs),
		StartAt:    startAt,
		FinishAt:   finishAt,
		CreatedAt:  createdAt,
	}

	err = repo.DbqLog.Insert(e)
	if err != nil {
		return slf.sendFailed(fmt.Sprintf("%+v", err))
	}

	return slf.sendSuccess()
}
