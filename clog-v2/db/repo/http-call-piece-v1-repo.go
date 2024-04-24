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

var HttpCallPieceV1 *stuRepo[entity.HttpCallPieceV1]

func init() {
	add(func(dbi ice.DbInstance) {
		HttpCallPieceV1 = new(dbi, "http_call_piece_v1", `
					created_at, uid,
					user_id, partner_id, svc_name, svc_version, url,
					req_header, req_param, req_query, req_form, req_files,
					req_body, started_at`,
			func(e *entity.HttpCallPieceV1) []any {
				return []any{
					e.CreatedAt, e.Uid,
					e.UserId, e.PartnerId, e.SvcName, e.SvcVersion, e.Url,
					e.ReqHeader, e.ReqParam, e.ReqQuery, e.ReqForm, e.ReqFiles,
					e.ReqBody, e.StartedAt,
				}
			})
	})
}
