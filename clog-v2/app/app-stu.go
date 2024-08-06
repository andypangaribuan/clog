/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package app

import "github.com/andypangaribuan/gmod/ice"

type stuEnv struct {
	AppName        string
	AppEnv         ice.AppEnv
	AppTimezone    string
	AppAutoRecover bool
	GrpcPort       int

	DbHost string
	DbPort int
	DbName string
	DbUser string
	DbPass string
	DbType string
}
