/*
 * Copyright (c) 2025.
 * Created by Andy Pangaribuan (iam.pangaribuan@gmail.com)
 * https://github.com/apangaribuan
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package test

import (
	_ "github.com/andypangaribuan/gmod"
	"github.com/andypangaribuan/gmod/gm"
)

func init() {
	loadEnv()
	gm.Conf.
		SetClogAddress(env.ClogAddress, env.AppName, env.AppVersion).
		SetTimezone(env.AppTimezone).
		Commit()
}
