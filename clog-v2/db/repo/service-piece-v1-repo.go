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

	"github.com/andypangaribuan/gmod/ice"
)

var ServicePieceV1 *stuRepo[entity.ServicePieceV1]

func init() {
	add(func(dbi ice.DbInstance) {
		ServicePieceV1 = new[entity.ServicePieceV1](dbi, "service_piece_v1", `
					created_at, uid,
					svc_name, svc_version, endpoint, url, req_header,
					req_param, req_query, req_form, req_body, client_ip,
					started_at`,
			func(e *entity.ServicePieceV1) []any {
				return []any{
					e.CreatedAt, e.Uid,
					e.SvcName, e.SvcVersion, e.Endpoint, e.Url, e.ReqHeader,
					e.ReqParam, e.ReqQuery, e.ReqForm, e.ReqBody, e.ClientIp,
					e.StartedAt,
				}
			})
	})
}
