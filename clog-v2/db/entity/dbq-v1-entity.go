/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package entity

import "time"

type DbqV1 struct {
	CreatedAt    time.Time `db:"created_at" json:"created_at"`
	Uid          string    `db:"uid" json:"uid"`
	UserId       *string   `db:"user_id" json:"user_id"`
	PartnerId    *string   `db:"partner_id" json:"partner_id"`
	SvcName      string    `db:"svc_name" json:"svc_name"`
	SvcVersion   string    `db:"svc_version" json:"svc_version"`
	SqlQuery     string    `db:"sql_query" json:"sql_query"`
	SqlArgs      *string   `db:"sql_args" json:"sql_args"`
	Severity     string    `db:"severity" json:"severity"`
	ExecPath     string    `db:"exec_path" json:"exec_path"`
	ExecFunction string    `db:"exec_function" json:"exec_function"`
	ErrorMessage *string   `db:"error_message" json:"error_message"`
	StackTrace   *string   `db:"stack_trace" json:"stack_trace"`
	DbName       *string   `db:"db_name" json:"db_name"`
	SchemaName   *string   `db:"schema_name" json:"schema_name"`
	Host1        string    `db:"host1" json:"host1"`
	Host2        *string   `db:"host2" json:"host2"`
	Duration1    int       `db:"duration1" json:"duration1"`
	Duration2    *int      `db:"duration2" json:"duration2"`
	Duration     int       `db:"duration" json:"duration"`
	StartedAt    time.Time `db:"started_at" json:"started_at"`
	FinishedAt   time.Time `db:"finished_at" json:"finished_at"`
}
