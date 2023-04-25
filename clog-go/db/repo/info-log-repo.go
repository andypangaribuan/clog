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

type srInfoLog struct {
	repo *db.Repo[entity.InfoLog]
}

func (slf srInfoLog) new() *srInfoLog {
	slf.repo = new(db.Repo[entity.InfoLog])
	slf.repo.DbInstance = app.Db
	slf.repo.PrintUnsafeErr = !app.Env.AppEnv.IsProd()

	slf.repo.TableName = "info_log"
	slf.repo.SetInsertColumnNames(`
		id, uid, user_id, partner_id, xid,
		svc_name, svc_version, svc_parent, message, severity,
		path, function, data, created_at`)
	slf.repo.InsertParamSign = slf.repo.GenerateParamSigns(slf.repo.InsertColumnNames)

	return &slf
}

func (slf *srInfoLog) Insert(e entity.InfoLog) error {
	return slf.repo.Insert(nil,
		e.Id, e.Uid, e.UserId, e.PartnerId, e.Xid,
		e.SvcName, e.SvcVersion, e.SvcParent, e.Message, e.Severity,
		e.Path, e.Function, e.Data, e.CreatedAt,
	)
}
