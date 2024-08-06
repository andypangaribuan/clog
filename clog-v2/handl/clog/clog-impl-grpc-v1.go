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

func (slf *stuClog) grpcV1(req *sclog.RequestGrpcV1, _ map[string]string) (*sclog.Response, error) {
	e := &entity.GrpcV1{
		CreatedAt:        gm.Util.Timenow(),
		Uid:              req.Uid,
		UserId:           fm.DirectPbwGet[string](req.UserId),
		PartnerId:        fm.DirectPbwGet[string](req.PartnerId),
		SvcName:          req.SvcName,
		SvcVersion:       req.SvcVersion,
		SvcParentName:    fm.DirectPbwGet[string](req.SvcParentName),
		SvcParentVersion: fm.DirectPbwGet[string](req.SvcParentVersion),
		Destination:      req.Destination,
		Severity:         req.Severity,
		ExecPath:         req.ExecPath,
		ExecFunction:     req.ExecFunction,
		ReqHeader:        fm.DirectPbwGet[string](req.ReqHeader),
		Data:             fm.DirectPbwGet[string](req.Data),
	}

	err := repo.GrpcV1.Insert(trimGrpcV1(e))
	saveError(err, err)

	return send(err)
}
