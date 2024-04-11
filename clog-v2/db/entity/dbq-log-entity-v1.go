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

type DbqLogV1 struct {
	CreatedAt    time.Time `db:"created_at"`
	Uid          string    `db:"uid"`
	UserId       *string   `db:"user_id"`
	PartnerId    *string   `db:"partner_id"`
	SvcName      string    `db:"svc_name"`
	SvcVersion   string    `db:"svc_version"`
	SqlQuery     string    `db:"sql_query"`
	SqlArgs      *string   `db:"sql_args"`
	Severity     string    `db:"severity"`
	ExecPath     string    `db:"exec_path"`
	Function     string    `db:"function"`
	ErrorMessage *string   `db:"error_message"`
	StackTrace   *string   `db:"stack_trace"`
	Host1        string    `db:"host1"`
	Host2        *string   `db:"host2"`
	Duration1    int       `db:"duration1"`
	Duration2    *int      `db:"duration2"`
	Duration     int       `db:"duration"`
	StartedAt    time.Time `db:"started_at"`
	FinishedAt   time.Time `db:"finished_at"`
}
