/*
 * Copyright (c) 2023.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

package entity

import "time"

type ServiceLog struct {
	Id         string    `db:"id"`
	Uid        string    `db:"uid"`
	UserId     *string   `db:"user_id"`
	PartnerId  *string   `db:"partner_id"`
	Xid        *string   `db:"xid"`
	SvcName    string    `db:"svc_name"`
	SvcVersion string    `db:"svc_version"`
	SvcParent  *string   `db:"svc_parent"`
	Endpoint   string    `db:"endpoint"`
	Version    string    `db:"version"`
	Message    *string   `db:"message"`
	Severity   string    `db:"severity"`
	Path       string    `db:"path"`
	Function   string    `db:"function"`
	ReqHeader  *string   `db:"req_header"`
	ReqBody    *string   `db:"req_body"`
	ReqPar     *string   `db:"req_par"`
	ResData    *string   `db:"res_data"`
	ResCode    *int      `db:"res_code"`
	Data       *string   `db:"data"`
	Error      *string   `db:"error"`
	StackTrace *string   `db:"stack_trace"`
	ClientIp   string    `db:"client_ip"`
	DurationMs int       `db:"duration_ms"`
	StartAt    time.Time `db:"start_at"`
	FinishAt   time.Time `db:"finish_at"`
	CreatedAt  time.Time `db:"created_at"`
}
