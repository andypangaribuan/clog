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
	"github.com/andypangaribuan/gmod/gm"
	"github.com/andypangaribuan/gmod/mol"
)

func initDb() {
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
