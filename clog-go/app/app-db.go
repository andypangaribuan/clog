/*
 * Copyright (c) 2023.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

package app

import (
	"time"

	"github.com/andypangaribuan/project9/model"
	"github.com/andypangaribuan/project9/p9"
)

func dbInitialize() {
	configRead := &model.DbConfig{
		MaxLifeTimeConnection: time.Minute * time.Duration(Env.DbRead.MaxLifetime),
		MaxIdleConnection:     Env.DbRead.MaxIdle,
		MaxOpenConnection:     Env.DbRead.MaxOpen,
	}

	configWrite := &model.DbConfig{
		MaxLifeTimeConnection: time.Minute * time.Duration(Env.DbWrite.MaxLifetime),
		MaxIdleConnection:     Env.DbWrite.MaxIdle,
		MaxOpenConnection:     Env.DbWrite.MaxOpen,
	}

	read := p9.Db.NewPostgresInstance(
		Env.DbRead.Host, Env.DbRead.Port, Env.DbRead.Name,
		Env.DbRead.Username, Env.DbRead.Password, &Env.DbRead.Scheme,
		configRead, true, Env.DbRead.UnsafeCompatibility,
		Env.AppName, Env.DbRead.PrintSql)

	write := p9.Db.NewPostgresInstance(
		Env.DbWrite.Host, Env.DbWrite.Port, Env.DbWrite.Name,
		Env.DbWrite.Username, Env.DbWrite.Password, &Env.DbWrite.Scheme,
		configWrite, true, Env.DbWrite.UnsafeCompatibility,
		Env.AppName, Env.DbWrite.PrintSql)

	Db = p9.Db.NewReadWritePostgresInstance(read, write)
}
