/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package test

import "github.com/andypangaribuan/gmod/gm"

func loadEnv() {
	dirPath, err := gm.Util.GetExecDir()
	if err != nil {
		panic(err)
	}

	gm.Util.LoadEnv(dirPath + "/z-local.env")

	env = &stuEnv{
		AppName:     gm.Util.Env.GetString("APP_NAME"),
		AppTimezone: gm.Util.Env.GetString("APP_TIMEZONE"),

		DbHost: gm.Util.Env.GetString("DB_HOST"),
		DbPort: gm.Util.Env.GetInt("DB_PORT"),
		DbName: gm.Util.Env.GetString("DB_NAME"),
		DbUser: gm.Util.Env.GetString("DB_USER"),
		DbPass: gm.Util.Env.GetString("DB_PASS"),
	}
}
