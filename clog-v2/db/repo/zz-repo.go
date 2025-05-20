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

func new[T any](dbi ice.DbInstance, tableName string, symbols string, columns string, fn func(e *T) []any, opt ...db.RepoOptBuilder) *stuRepo[T] {
	repo := db.NewRepo[T](dbi, tableName, opt...)
	repo.SetInsert(columns, fn)

	stu := &stuRepo[T]{repo: repo}
	stu.xrepo.repo = repo

	if app.Env.DbType == "questdb" {
		stu.xrepo.tableName = tableName
		stu.xrepo.fn = fn
		stu.xrepo.qdbSymbols = make(map[string]any, 0)
		stu.xrepo.qdbColumns = make([]string, 0)

		sys := gm.Util.ReplaceAll(&symbols, "", "\n", "\t", " ")
		if *sys != "" {
			ls := strings.Split(*sys, ",")
			for _, column := range ls {
				stu.qdbSymbols[column] = nil
			}
		}

		cm := gm.Util.ReplaceAll(&columns, "", "\n", "\t", " ")
		stu.xrepo.qdbColumns = strings.Split(*cm, ",")
	}

	if app.Env.DbType == "clickhouse" {
		stu.xrepo.tableName = tableName
		stu.xrepo.fn = fn

		cm := gm.Util.ReplaceAll(&columns, "", "\n", "\t", " ")
		stu.xrepo.chColumns = *cm

		ls := strings.Split(*cm, ",")
		for range ls {
			if stu.xrepo.chArgs != "" {
				stu.xrepo.chArgs += ","
			}
			stu.xrepo.chArgs += "?"
		}
	}

	return stu
}
