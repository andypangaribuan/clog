/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package test

type stuEnv struct {
	AppName     string
	AppTimezone string

	DbHost string
	DbPort int
	DbName string
	DbUser string
	DbPass string

	ClogGrpcAddress string
}
