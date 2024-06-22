/*
 * Copyright (c) 2023.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

package app

import (
	"github.com/andypangaribuan/project9/act/actenv"
	"github.com/andypangaribuan/project9/p9"
)

type srEnv struct {
	AppName        string
	AppVersion     string
	AppPortRestful int
	AppPortGRPC    int
	AppEnv         actenv.AppEnv
	AppAutoRecover bool
	Timezone       string

	DbRead    *srDB
	DbWrite   *srDB
	TableName *srTableName
}

type srDB struct {
	Host                string
	Port                int
	Name                string
	Scheme              string
	Username            string
	Password            string
	UnsafeCompatibility bool
	PrintSql            bool
	MaxLifetime         int
	MaxIdle             int
	MaxOpen             int
}

type srTableName struct {
	ServiceLog string
	DbqLog     string
	InfoLog    string
}

func envInitialize() {
	Env = &srEnv{
		AppName:        p9.Util.Env.GetStr("APP_NAME"),
		AppVersion:     p9.Util.Env.GetStr("APP_VERSION", "0.0.0"),
		AppPortRestful: p9.Util.Env.GetInt("APP_PORT_RESTFUL"),
		AppPortGRPC:    p9.Util.Env.GetInt("APP_PORT_GRPC"),
		AppEnv:         p9.Util.Env.GetAppEnv("APP_ENV"),
		AppAutoRecover: p9.Util.Env.GetBool("APP_AUTO_RECOVER"),
		Timezone:       p9.Util.Env.GetStr("TIMEZONE"),

		DbRead: &srDB{
			Host:                p9.Util.Env.GetStr("DB_READ_HOST"),
			Port:                p9.Util.Env.GetInt("DB_READ_PORT"),
			Name:                p9.Util.Env.GetStr("DB_READ_NAME"),
			Scheme:              p9.Util.Env.GetStr("DB_READ_SCHEME"),
			Username:            p9.Util.Env.GetStr("DB_READ_USERNAME"),
			Password:            p9.Util.Env.GetStr("DB_READ_PASSWORD"),
			UnsafeCompatibility: p9.Util.Env.GetBool("DB_READ_UNSAFE_COMPATIBILITY"),
			PrintSql:            p9.Util.Env.GetBool("DB_PRINT_SQL"),
			MaxLifetime:         p9.Util.Env.GetInt("DB_READ_MAX_LIFETIME"),
			MaxIdle:             p9.Util.Env.GetInt("DB_READ_MAX_IDLE"),
			MaxOpen:             p9.Util.Env.GetInt("DB_READ_MAX_OPEN"),
		},

		DbWrite: &srDB{
			Host:                p9.Util.Env.GetStr("DB_HOST"),
			Port:                p9.Util.Env.GetInt("DB_PORT"),
			Name:                p9.Util.Env.GetStr("DB_NAME"),
			Scheme:              p9.Util.Env.GetStr("DB_SCHEME"),
			Username:            p9.Util.Env.GetStr("DB_USERNAME"),
			Password:            p9.Util.Env.GetStr("DB_PASSWORD"),
			UnsafeCompatibility: p9.Util.Env.GetBool("DB_UNSAFE_COMPATIBILITY"),
			PrintSql:            p9.Util.Env.GetBool("DB_READ_PRINT_SQL"),
			MaxLifetime:         p9.Util.Env.GetInt("DB_MAX_LIFETIME"),
			MaxIdle:             p9.Util.Env.GetInt("DB_MAX_IDLE"),
			MaxOpen:             p9.Util.Env.GetInt("DB_MAX_OPEN"),
		},

		TableName: &srTableName{
			ServiceLog: p9.Util.Env.GetStr("TABLE_NAME_SERVICE_LOG", "service_log"),
			DbqLog:     p9.Util.Env.GetStr("TABLE_NAME_DBQ_LOG", "dbq_log"),
			InfoLog:    p9.Util.Env.GetStr("TABLE_NAME_INFO_LOG", "info_log"),
		},
	}
}
