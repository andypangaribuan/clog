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

func (slf *stuClog) serviceV1(req *sclog.RequestServiceV1, header map[string]string) (*sclog.Response, error) {
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

	e := &entity.ServiceV1{
		CreatedAt:        gm.Util.Timenow(),
		Uid:              req.Uid,
		UserId:           fm.DirectPbwGet[string](req.UserId),
		PartnerId:        fm.DirectPbwGet[string](req.PartnerId),
		SvcName:          req.SvcName,
		SvcVersion:       req.SvcVersion,
		SvcParent:        fm.DirectPbwGet[string](req.SvcParent),
		SvcParentVersion: fm.DirectPbwGet[string](req.SvcParentVersion),
		Endpoint:         req.Endpoint,
		Url:              req.Url,
		Severity:         req.Severity,
		ExecPath:         req.ExecPath,
		ExecFunction:     req.ExecFunction,
		ReqVersion:       fm.DirectPbwGet[string](req.ReqVersion),
		ReqHeader:        fm.DirectPbwGet[string](req.ReqHeader),
		ReqParam:         fm.DirectPbwGet[string](req.ReqParam),
		ReqQuery:         fm.DirectPbwGet[string](req.ReqQuery),
		ReqForm:          fm.DirectPbwGet[string](req.ReqForm),
		ReqFiles:         fm.DirectPbwGet[string](req.ReqFiles),
		ReqBody:          fm.DirectPbwGet[string](req.ReqBody),
		ResData:          fm.DirectPbwGet[string](req.ResData),
		ResCode:          int(req.ResCode),
		ErrorMessage:     fm.DirectPbwGet[string](req.ErrMessage),
		StackTrace:       fm.DirectPbwGet[string](req.StackTrace),
		ClientIp:         req.ClientIp,
		Duration:         duration,
	}

	e.StartedAt = fm.GetDefault(startedAt, e.StartedAt)
	e.FinishedAt = fm.GetDefault(finishedAt, e.FinishedAt)

	err = repo.ServiceV1.Insert(e)
	saveError(err, e)

	return send(err)
}
