/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package app

import "github.com/andypangaribuan/gmod/gm"

var Env *stuEnv

func initEnv() {
	Env = &stuEnv{
		AppName:        gm.Util.Env.GetString("APP_NAME"),
		AppEnv:         gm.Util.Env.GetAppEnv("APP_ENV"),
		AppAutoRecover: gm.Util.Env.GetBool("APP_AUTO_RECOVER"),
		GrpcPort:       gm.Util.Env.GetInt("GRPC_PORT"),

		DbHost: gm.Util.Env.GetString("DB_HOST"),
		DbPort: gm.Util.Env.GetInt("DB_PORT"),
		DbName: gm.Util.Env.GetString("DB_NAME"),
		DbUser: gm.Util.Env.GetString("DB_USER"),
		DbPass: gm.Util.Env.GetString("DB_PASS"),
	}
}
