/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package app

import (
	"fmt"
	"log"

	"github.com/andypangaribuan/gmod/gm"
	"github.com/andypangaribuan/gmod/mol"
	qdb "github.com/questdb/go-questdb-client/v3"
)

func initDb() {
	if Env.DbType == "-" {
		return
	}

	if Env.DbType == "questdb" {
		pool, err := qdb.PoolFromOptions(qdb.WithHttp(), qdb.WithAddress(fmt.Sprintf("%v:%v", Env.DbHost, Env.DbPort)), qdb.WithBasicAuth(Env.DbUser, Env.DbPass), qdb.WithAutoFlushRows(1000))
		if err != nil {
			log.Fatalf(`error when initialize questdb pool connection\n%+v\n`, err)
		}

		QdbPool = pool
		return
	}

	conn := mol.DbConnection{
		AppName:  Env.AppName,
		Host:     Env.DbHost,
		Port:     Env.DbPort,
		Name:     Env.DbName,
		Username: Env.DbUser,
		Password: Env.DbPass,
	}

	Db = gm.Db.Postgres(conn)
}
