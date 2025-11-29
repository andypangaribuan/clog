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

type NoteV1 struct {
	CreatedAt    time.Time `db:"created_at"`
	Uid          string    `db:"uid"`
	UserId       *string   `db:"user_id"`
	PartnerId    *string   `db:"partner_id"`
	SvcName      string    `db:"svc_name"`
	SvcVersion   string    `db:"svc_version"`
	ExecPath     string    `db:"exec_path"`
	ExecFunction string    `db:"exec_function"`
	Key          *string   `db:"key"`
	SubKey       *string   `db:"sub_key"`
	Data         string    `db:"data"`
	OccurredAt   time.Time `db:"occurred_at"`
}
