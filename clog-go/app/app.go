/*
 * Copyright (c) 2023.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

package app

import (
	"github.com/andypangaribuan/project9"
	"github.com/andypangaribuan/project9/abs"
	"github.com/andypangaribuan/project9/f9"
)

var (
	Db  abs.DbPostgresInstance
	Env *srEnv
)

func init() {
	project9.Initialize()

	envInitialize()
	dbInitialize()

	f9.TimeZone = Env.Timezone
}
