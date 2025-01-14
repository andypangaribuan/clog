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
	"clog/app"
	"clog/db/entity"
	"strconv"

	"github.com/andypangaribuan/gmod/ice"
)

var ServiceV1 *stuRepo[entity.ServiceV1]

func init() {
	add(func(dbi ice.DbInstance) {
		ServiceV1 = new(dbi, "service_v1",
			"partner_id, svc_name, svc_parent_name, endpoint, url, severity, res_code, res_sub_code", `
				created_at, uid,
				user_id, partner_id, svc_name, svc_version, svc_parent_name,
				svc_parent_version, endpoint, url, severity, exec_path,
				exec_function, req_version, req_source, req_header, req_param,
				req_query, req_form, req_files, req_body, res_data,
				res_code, res_sub_code, error_message, stack_trace, client_ip,
				duration, started_at, finished_at`,
			func(e *entity.ServiceV1) []any {
				var resCode any = e.ResCode

				if app.Env.DbType == "questdb" {
					resCode = strconv.Itoa(e.ResCode)
				}

				return []any{
					e.CreatedAt, e.Uid,
					e.UserId, e.PartnerId, e.SvcName, e.SvcVersion, e.SvcParentName,
					e.SvcParentVersion, e.Endpoint, e.Url, e.Severity, e.ExecPath,
					e.ExecFunction, e.ReqVersion, e.ReqSource, e.ReqHeader, e.ReqParam,
					e.ReqQuery, e.ReqForm, e.ReqFiles, e.ReqBody, e.ResData,
					resCode, e.ResSubCode, e.ErrorMessage, e.StackTrace, e.ClientIp,
					e.Duration, e.StartedAt, e.FinishedAt,
				}
			})
	})
}
