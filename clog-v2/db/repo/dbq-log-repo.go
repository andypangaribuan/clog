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

var DbqLog *stuDbqLog

type stuDbqLog struct {
	repo db.Repo[entity.DbqLog]
}

func init() {
	add(func(dbi ice.DbInstance) {
		stu := new(stuDbqLog)
		DbqLog = stu

		stu.repo = db.NewRepo[entity.DbqLog](dbi, "dbq_log")
		stu.repo.SetInsertColumn(`
				created_at, uid,
				user_id, partner_id, svc_name, svc_version, sql_query,
				sql_args, severity, exec_path, function, error_message,
				stack_trace, host1, host2, duration1, duration2,
				duration, started_at, finished_at`)
		stu.repo.SetInsertArgs(func(e *entity.DbqLog) []any {
			return []any{
				e.CreatedAt, e.Uid,
				e.UserId, e.PartnerId, e.SvcName, e.SvcVersion, e.SqlQuery,
				e.SqlArgs, e.Severity, e.ExecPath, e.Function, e.ErrorMessage,
				e.StackTrace, e.Host1, e.Host2, e.Duration1, e.Duration2,
				e.Duration, e.StartedAt, e.FinishedAt,
			}
		})
	})
}

func (slf *stuDbqLog) Insert(e *entity.DbqLog) error {
	return slf.repo.XInsert(e)
}
