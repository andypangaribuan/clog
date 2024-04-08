/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package test

import (
	"github.com/andypangaribuan/gmod/fm"
	"github.com/andypangaribuan/gmod/gm"
	"github.com/andypangaribuan/gmod/mol"
)

func db() {
	conn := mol.DbConnection{
		AppName:  gm.Util.Env.GetString("APP_NAME"),
		Host:     gm.Util.Env.GetString("DBW_HOST"),
		Port:     gm.Util.Env.GetInt("DBW_PORT"),
		Name:     gm.Util.Env.GetString("DBW_NAME"),
		Username: gm.Util.Env.GetString("DBW_USER"),
		Password: gm.Util.Env.GetString("DBW_PASS"),

		PrintSql: fm.Ptr(gm.Util.Env.GetBool("DB_PRINT_SQL")),
	}

	_ = gm.Db.Postgres(conn)
}
