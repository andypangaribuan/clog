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

var GrpcV1 *stuRepo[entity.GrpcV1]

func init() {
	add(func(dbi ice.DbInstance) {
		GrpcV1 = new(dbi, "grpc_v1",
			"partner_id, svc_name, svc_parent_name, destination, severity", `
				created_at, uid,
				user_id, partner_id, svc_name, svc_version, svc_parent_name,
				svc_parent_version, destination, severity, exec_path, exec_function,
				req_header, data`,
			func(e *entity.GrpcV1) []any {
				return []any{
					e.CreatedAt, e.Uid,
					e.UserId, e.PartnerId, e.SvcName, e.SvcVersion, e.SvcParentName,
					e.SvcParentVersion, e.Destination, e.Severity, e.ExecPath, e.ExecFunction,
					e.ReqHeader, e.Data,
				}
			})
	})
}
