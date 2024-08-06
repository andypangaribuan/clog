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

var HttpCallV1 *stuRepo[entity.HttpCallV1]

func init() {
	add(func(dbi ice.DbInstance) {
		HttpCallV1 = new(dbi, "http_call_v1", `
					created_at, uid,
					user_id, partner_id, svc_name, svc_version, url,
					severity, req_header, req_param, req_query, req_form,
					req_files, req_body, res_data, res_code, error_message,
					stack_trace, duration, started_at, finished_at`,
			func(e *entity.HttpCallV1) []any {
				var resCode any = e.ResCode

				if app.Env.DbType == "questdb" {
					resCode = strconv.Itoa(e.ResCode)
				}

				return []any{
					e.CreatedAt, e.Uid,
					e.UserId, e.PartnerId, e.SvcName, e.SvcVersion, e.Url,
					e.Severity, e.ReqHeader, e.ReqParam, e.ReqQuery, e.ReqForm,
					e.ReqFiles, e.ReqBody, e.ResData, resCode, e.ErrorMessage,
					e.StackTrace, e.Duration, e.StartedAt, e.FinishedAt,
				}
			})
	})
}
