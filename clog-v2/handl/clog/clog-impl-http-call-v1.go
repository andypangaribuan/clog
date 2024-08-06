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

func (stu *stuClog) httpCallV1(req *sclog.RequestHttpCallV1, _ map[string]string) (*sclog.Response, error) {
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

	e := &entity.HttpCallV1{
		CreatedAt:    gm.Util.Timenow(),
		Uid:          req.Uid,
		UserId:       fm.DirectPbwGet[string](req.UserId),
		PartnerId:    fm.DirectPbwGet[string](req.PartnerId),
		SvcName:      req.SvcName,
		SvcVersion:   req.SvcVersion,
		Url:          req.Url,
		Severity:     req.Severity,
		ReqHeader:    fm.DirectPbwGet[string](req.ReqHeader),
		ReqParam:     fm.DirectPbwGet[string](req.ReqParam),
		ReqQuery:     fm.DirectPbwGet[string](req.ReqQuery),
		ReqForm:      fm.DirectPbwGet[string](req.ReqForm),
		ReqFiles:     fm.DirectPbwGet[string](req.ReqFiles),
		ReqBody:      fm.DirectPbwGet[string](req.ReqBody),
		ResData:      fm.DirectPbwGet[string](req.ResData),
		ResCode:      int(req.ResCode),
		ErrorMessage: fm.DirectPbwGet[string](req.ErrMessage),
		StackTrace:   fm.DirectPbwGet[string](req.StackTrace),
		Duration:     duration,
	}

	e.StartedAt = fm.GetDefault(startedAt, e.StartedAt)
	e.FinishedAt = fm.GetDefault(finishedAt, e.FinishedAt)

	err = repo.HttpCallV1.Insert(trimHttpCallV1(e))
	saveError(err, e)

	return send(err)
}
