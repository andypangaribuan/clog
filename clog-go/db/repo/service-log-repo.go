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

type srServiceLog struct {
	repo *db.Repo[entity.ServiceLog]
}

func (slf srServiceLog) new() *srServiceLog {
	slf.repo = new(db.Repo[entity.ServiceLog])
	slf.repo.DbInstance = app.Db
	slf.repo.PrintUnsafeErr = !app.Env.AppEnv.IsProd()

	slf.repo.TableName = app.Env.TableName.ServiceLog
	slf.repo.SetInsertColumnNames(`
		id, uid, user_id, partner_id, xid,
		svc_name, svc_version, svc_parent, endpoint, version,
		message, severity, path, function, req_header,
		req_body, req_par, res_data, res_code, data,
		error, stack_trace, client_ip, duration_ms, start_at,
		finish_at, created_at`)
	slf.repo.InsertParamSign = slf.repo.GenerateParamSigns(slf.repo.InsertColumnNames)

	return &slf
}

func (slf *srServiceLog) Insert(e entity.ServiceLog) error {
	return slf.repo.Insert(nil,
		e.Id, e.Uid, e.UserId, e.PartnerId, e.Xid,
		e.SvcName, e.SvcVersion, e.SvcParent, e.Endpoint, e.Version,
		e.Message, e.Severity, e.Path, e.Function, e.ReqHeader,
		e.ReqBody, e.ReqPar, e.ResData, e.ResCode, e.Data,
		e.Error, e.StackTrace, e.ClientIp, e.DurationMs, e.StartAt,
		e.FinishAt, e.CreatedAt,
	)
}
