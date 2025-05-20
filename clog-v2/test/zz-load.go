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
	env = &stuEnv{
		AppName:     gm.Util.Env.GetString("APP_NAME"),
		AppVersion:  gm.Util.Env.GetString("APP_VERSION"),
		AppTimezone: gm.Util.Env.GetString("APP_TIMEZONE"),

		ClogAddress: gm.Util.Env.GetString("CLOG_ADDRESS"),
	}
}
