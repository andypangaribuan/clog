/*
 * Copyright (c) 2025.
 * Created by Andy Pangaribuan (iam.pangaribuan@gmail.com)
 * https://github.com/apangaribuan
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package clog

import (
	"clog/db/entity"
	"clog/db/repo"

	"github.com/andypangaribuan/gmod/fm"
	"github.com/andypangaribuan/gmod/gm"
	"github.com/andypangaribuan/gmod/grpc/service/sclog"
)

func (slf *stuClog) distLockV1(req *sclog.RequestDistLockV1, _ map[string]string) (*sclog.Response, error) {
	var (
		timenow  = gm.Util.Timenow()
		duration int
	)

	startedAt, _ := gm.Conv.Time.ToTimeFull(req.StartedAt)
	finishedAt, _ := gm.Conv.Time.ToTimeFull(req.FinishedAt)
	if startedAt != nil && finishedAt != nil {
		duration = int(finishedAt.Sub(*startedAt).Milliseconds())
	}

	e := &entity.DistLockV1{
		CreatedAt:    timenow,
		Uid:          req.Uid,
		UserId:       fm.DirectPbwGet[string](req.UserId),
		PartnerId:    fm.DirectPbwGet[string](req.PartnerId),
		SvcName:      req.SvcName,
		SvcVersion:   req.SvcVersion,
		Engine:       req.Engine,
		Address:      req.Address,
		Key:          req.Key,
		ErrorWhen:    fm.DirectPbwGet[string](req.ErrWhen),
		ErrorMessage: fm.DirectPbwGet[string](req.ErrMessage),
		StackTrace:   fm.DirectPbwGet[string](req.StackTrace),
		Duration:     duration,
		StartedAt:    fm.GetDefault(startedAt, timenow),
		FinishedAt:   fm.GetDefault(finishedAt, timenow),
	}

	err := repo.DistLockV1.Insert(e)
	saveError(err, e)
	return send(err)
}
