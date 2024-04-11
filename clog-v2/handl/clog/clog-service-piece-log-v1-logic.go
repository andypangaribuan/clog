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
	"clog/res/proto/generated/sclog"

	"github.com/andypangaribuan/gmod/fm"
	"github.com/andypangaribuan/gmod/gm"
)

func (slf *stuClog) servicePieceLogV1(req *sclog.RequestServicePieceLogV1, header map[string]string) (*sclog.Response, error) {
	startedAt, _ := gm.Conv.Time.ToTimeFull(req.StartedAt)

	e := &entity.ServicePieceLogV1{
		CreatedAt:  gm.Util.Timenow(),
		Uid:        req.Uid,
		SvcName:    req.SvcName,
		SvcVersion: req.SvcVersion,
		Endpoint:   req.Endpoint,
		Url:        req.Url,
		ReqHeader:  fm.DirectPbwGet[string](req.ReqHeader),
		ReqParam:   fm.DirectPbwGet[string](req.ReqParam),
		ReqQuery:   fm.DirectPbwGet[string](req.ReqQuery),
		ReqForm:    fm.DirectPbwGet[string](req.ReqForm),
		ReqBody:    fm.DirectPbwGet[string](req.ReqBody),
		ClientIp:   req.ClientIp,
	}

	e.StartedAt = fm.Ternary(startedAt == nil, e.StartedAt, *startedAt)

	err := repo.ServicePieceV1.Insert(e)
	return send(err)
}
