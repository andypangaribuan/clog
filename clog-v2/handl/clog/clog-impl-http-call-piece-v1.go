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

	"github.com/andypangaribuan/gmod/fm"
	"github.com/andypangaribuan/gmod/gm"
	"github.com/andypangaribuan/gmod/grpc/service/sclog"
)

func (slf *stuClog) httpCallPieceV1(req *sclog.RequestHttpCallPieceV1, _ map[string]string) (*sclog.Response, error) {
	startedAt, _ := gm.Conv.Time.ToTimeFull(req.StartedAt)

	e := &entity.HttpCallPieceV1{
		CreatedAt:  gm.Util.Timenow(),
		Uid:        req.Uid,
		UserId:     fm.DirectPbwGet[string](req.UserId),
		PartnerId:  fm.DirectPbwGet[string](req.PartnerId),
		SvcName:    req.SvcName,
		SvcVersion: req.SvcVersion,
		Url:        req.Url,
		ReqHeader:  fm.DirectPbwGet[string](req.ReqHeader),
		ReqParam:   fm.DirectPbwGet[string](req.ReqParam),
		ReqQuery:   fm.DirectPbwGet[string](req.ReqQuery),
		ReqForm:    fm.DirectPbwGet[string](req.ReqForm),
		ReqFiles:   fm.DirectPbwGet[string](req.ReqFiles),
		ReqBody:    fm.DirectPbwGet[string](req.ReqBody),
	}

	e.StartedAt = fm.GetDefault(startedAt, e.StartedAt)

	err := repo.HttpCallPieceV1.Insert(e)
	saveError(err, e)

	return send(err)
}
