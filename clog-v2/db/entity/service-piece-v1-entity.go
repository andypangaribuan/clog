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

type ServicePieceV1 struct {
	CreatedAt        time.Time `db:"created_at"`
	Uid              string    `db:"uid"`
	SvcName          string    `db:"svc_name"`
	SvcVersion       string    `db:"svc_version"`
	SvcParent        *string   `db:"svc_parent"`
	SvcParentVersion *string   `db:"svc_parent_version"`
	Endpoint         string    `db:"endpoint"`
	Url              string    `db:"url"`
	ReqVersion       *string   `db:"req_version"`
	ReqHeader        *string   `db:"req_header"`
	ReqParam         *string   `db:"req_param"`
	ReqQuery         *string   `db:"req_query"`
	ReqForm          *string   `db:"req_form"`
	ReqBody          *string   `db:"req_body"`
	ClientIp         string    `db:"client_ip"`
	StartedAt        time.Time `db:"started_at"`
}
