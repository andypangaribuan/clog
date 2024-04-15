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

type ServiceV1 struct {
	CreatedAt        time.Time `db:"created_at"`
	Uid              string    `db:"uid"`
	UserId           *string   `db:"user_id"`
	PartnerId        *string   `db:"partner_id"`
	SvcName          string    `db:"svc_name"`
	SvcVersion       string    `db:"svc_version"`
	SvcParent        *string   `db:"svc_parent"`
	SvcParentVersion *string   `db:"svc_parent_version"`
	Endpoint         string    `db:"endpoint"`
	Url              string    `db:"url"`
	Severity         string    `db:"severity"`
	ExecPath         string    `db:"exec_path"`
	ExecFunction     string    `db:"exec_function"`
	ReqVersion       *string   `db:"req_version"`
	ReqHeader        *string   `db:"req_header"`
	ReqParam         *string   `db:"req_param"`
	ReqQuery         *string   `db:"req_query"`
	ReqForm          *string   `db:"req_form"`
	ReqFiles         *string   `db:"req_files"`
	ReqBody          *string   `db:"req_body"`
	ResData          *string   `db:"res_data"`
	ResCode          int       `db:"res_code"`
	ErrorMessage     *string   `db:"error_message"`
	StackTrace       *string   `db:"stack_trace"`
	ClientIp         string    `db:"client_ip"`
	Duration         int       `db:"duration"`
	StartedAt        time.Time `db:"started_at"`
	FinishedAt       time.Time `db:"finished_at"`
}
