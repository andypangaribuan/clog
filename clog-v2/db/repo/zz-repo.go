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
	"strings"

	"github.com/andypangaribuan/gmod/core/db"
	"github.com/andypangaribuan/gmod/fm"
	"github.com/andypangaribuan/gmod/gm"
	"github.com/andypangaribuan/gmod/ice"
)

func init() {
	fm.OrderedInit(fm.OrderedLevelRepo, func() {
		for _, fn := range callbacks {
			fn(app.Db)
		}
	})
}

func add(callback func(dbi ice.DbInstance)) {
	mx.Lock()
	defer mx.Unlock()
	callbacks = append(callbacks, callback)
}

func new[T any](dbi ice.DbInstance, tableName string, columns string, fn func(e *T) []any, opt ...db.RepoOptBuilder) *stuRepo[T] {
	repo := db.NewRepo[T](dbi, tableName, opt...)
	repo.SetInsert(columns, fn)

	stu := &stuRepo[T]{repo: repo}
	stu.xrepo.repo = repo

	if app.Env.DbType == "clickhouse" {
		stu.tableName = tableName
		stu.fn = fn

		cm := gm.Util.ReplaceAll(&columns, "", "\n", "\t", " ")
		stu.chColumns = *cm

		ls := strings.Split(*cm, ",")
		for range ls {
			if stu.chArgs != "" {
				stu.chArgs += ","
			}
			stu.chArgs += "?"
		}
	}

	return stu
}
