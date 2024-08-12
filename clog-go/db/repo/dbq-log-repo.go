/*
 * Copyright (c) 2023.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

package repo

import (
	"clog/app"
	"clog/db/entity"

	"github.com/andypangaribuan/project9/core/db"
)

type srDbqLog struct {
	repo *db.Repo[entity.DbqLog]
}

func (slf srDbqLog) new() *srDbqLog {
	slf.repo = new(db.Repo[entity.DbqLog])
	slf.repo.DbInstance = app.Db
	slf.repo.PrintUnsafeErr = !app.Env.AppEnv.IsProd()

	slf.repo.TableName = app.Env.TableName.DbqLog
	slf.repo.SetInsertColumnNames(`
		id, uid, user_id, partner_id, xid,
		svc_name, svc_version, svc_parent, sql_query, sql_pars,
		severity, path, function, error, stack_trace,
		duration_ms, start_at, finish_at, created_at`)
	slf.repo.InsertParamSign = slf.repo.GenerateParamSigns(slf.repo.InsertColumnNames)

	return &slf
}

func (slf *srDbqLog) Insert(e *entity.DbqLog) error {
	return slf.repo.Insert(nil,
		e.Id, e.Uid, e.UserId, e.PartnerId, e.Xid,
		e.SvcName, e.SvcVersion, e.SvcParent, e.SqlQuery, e.SqlPars,
		e.Severity, e.Path, e.Function, e.Error, e.StackTrace,
		e.DurationMs, e.StartAt, e.FinishAt, e.CreatedAt,
	)
}
