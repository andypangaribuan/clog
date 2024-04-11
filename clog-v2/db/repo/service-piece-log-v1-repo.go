/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package repo

import (
	"clog/db/entity"

	"github.com/andypangaribuan/gmod/core/db"
	"github.com/andypangaribuan/gmod/ice"
)

var ServicePieceV1 *stuServicePieceV1

type stuServicePieceV1 struct {
	repo db.Repo[entity.ServicePieceLogV1]
}

func init() {
	add(func(dbi ice.DbInstance) {
		stu := new(stuServicePieceV1)
		ServicePieceV1 = stu

		stu.repo = db.NewRepo[entity.ServicePieceLogV1](dbi, "service_piece_log_v1")
		stu.repo.SetInsertColumn(`
			created_at, uid,
			svc_name, svc_version, endpoint, url, req_header,
			req_param, req_query, req_form, req_body, client_ip,
			started_at`)
		stu.repo.SetInsertArgs(func(e *entity.ServicePieceLogV1) []any {
			return []any{
				e.CreatedAt, e.Uid,
				e.SvcName, e.SvcVersion, e.Endpoint, e.Url, e.ReqHeader,
				e.ReqParam, e.ReqQuery, e.ReqForm, e.ReqBody, e.ClientIp,
				e.StartedAt,
			}
		})
	})
}

func (slf *stuServicePieceV1) Insert(e *entity.ServicePieceLogV1) error {
	return slf.repo.XInsert(e)
}
