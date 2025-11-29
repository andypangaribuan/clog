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

var DbqLogV1 *stuRepo[entity.DbqV1]

func init() {
	add(func(dbi ice.DbInstance) {
		DbqLogV1 = new(dbi, "dbq_v1", `
				created_at, uid,
				user_id, partner_id, svc_name, svc_version, sql_query,
				sql_args, severity, exec_path, exec_function, error_message,
				stack_trace, db_name, schema_name, host1, host2,
				duration1, duration2, duration, started_at, finished_at`,
			func(e *entity.DbqV1) []any {
				return []any{
					e.CreatedAt, e.Uid,
					e.UserId, e.PartnerId, e.SvcName, e.SvcVersion, e.SqlQuery,
					e.SqlArgs, e.Severity, e.ExecPath, e.ExecFunction, e.ErrorMessage,
					e.StackTrace, e.DbName, e.SchemaName, e.Host1, e.Host2,
					e.Duration1, e.Duration2, e.Duration, e.StartedAt, e.FinishedAt,
				}
			})
	})
}
