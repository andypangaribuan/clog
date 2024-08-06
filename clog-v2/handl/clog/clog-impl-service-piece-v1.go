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

func (slf *stuClog) servicePieceV1(req *sclog.RequestServicePieceV1, _ map[string]string) (*sclog.Response, error) {
	startedAt, _ := gm.Conv.Time.ToTimeFull(req.StartedAt)

	e := &entity.ServicePieceV1{
		CreatedAt:        gm.Util.Timenow(),
		Uid:              req.Uid,
		SvcName:          req.SvcName,
		SvcVersion:       req.SvcVersion,
		SvcParentName:    fm.DirectPbwGet[string](req.SvcParentName),
		SvcParentVersion: fm.DirectPbwGet[string](req.SvcParentVersion),
		Endpoint:         req.Endpoint,
		Url:              req.Url,
		ReqVersion:       fm.DirectPbwGet[string](req.ReqVersion),
		ReqSource:        fm.DirectPbwGet[string](req.ReqSource),
		ReqHeader:        fm.DirectPbwGet[string](req.ReqHeader),
		ReqParam:         fm.DirectPbwGet[string](req.ReqParam),
		ReqQuery:         fm.DirectPbwGet[string](req.ReqQuery),
		ReqForm:          fm.DirectPbwGet[string](req.ReqForm),
		ReqBody:          fm.DirectPbwGet[string](req.ReqBody),
		ClientIp:         req.ClientIp,
	}

	e.StartedAt = fm.GetDefault(startedAt, e.StartedAt)

	err := repo.ServicePieceV1.Insert(trimServicePieceV1(e))
	saveError(err, e)

	return send(err)
}
