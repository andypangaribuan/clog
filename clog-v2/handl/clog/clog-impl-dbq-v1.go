/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package clog

import (
	"clog/db/entity"
	"clog/db/repo"
	"time"

	"github.com/andypangaribuan/gmod/fm"
	"github.com/andypangaribuan/gmod/gm"
	"github.com/andypangaribuan/gmod/grpc/service/sclog"
)

func (slf *stuClog) dbqV1(req *sclog.RequestDbqV1, _ map[string]string) (*sclog.Response, error) {
	var (
		startedAt  *time.Time
		finishedAt *time.Time
		duration   int
		err        error
	)

	startedAt, _ = gm.Conv.Time.ToTimeFull(req.StartedAt)
	finishedAt, _ = gm.Conv.Time.ToTimeFull(req.FinishedAt)
	if startedAt != nil && finishedAt != nil {
		duration = int(finishedAt.Sub(*startedAt).Milliseconds())
	}

	e := &entity.DbqV1{
		CreatedAt:    gm.Util.Timenow(),
		Uid:          req.Uid,
		UserId:       fm.DirectPbwGet[string](req.UserId),
		PartnerId:    fm.DirectPbwGet[string](req.PartnerId),
		SvcName:      req.SvcName,
		SvcVersion:   req.SvcVersion,
		SqlQuery:     req.SqlQuery,
		SqlArgs:      fm.DirectPbwGet[string](req.SqlArgs),
		Severity:     req.Severity,
		ExecPath:     req.ExecPath,
		ExecFunction: req.ExecFunction,
		ErrorMessage: fm.DirectPbwGet[string](req.ErrorMessage),
		StackTrace:   fm.DirectPbwGet[string](req.StackTrace),
		Host1:        req.Host1,
		Host2:        fm.DirectPbwGet[string](req.Host2),
		Duration1:    int(req.Duration1),
		Duration2:    fm.DirectPbwGet[int](req.Duration2),
		Duration:     duration,
	}

	e.StartedAt = fm.GetDefault(startedAt, e.StartedAt)
	e.FinishedAt = fm.GetDefault(finishedAt, e.FinishedAt)

	err = repo.DbqLogV1.Insert(e)
	saveError(err, e)

	return send(err)
}
