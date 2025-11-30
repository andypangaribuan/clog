/*
 * Copyright (c) 2025.
 * Created by Andy Pangaribuan (iam.pangaribuan@gmail.com)
 * https://github.com/apangaribuan
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package entity

import "time"

type DistLockV1 struct {
	CreatedAt      time.Time `db:"created_at"`
	Uid            string    `db:"uid"`
	UserId         *string   `db:"user_id"`
	PartnerId      *string   `db:"partner_id"`
	SvcName        string    `db:"svc_name"`
	SvcVersion     string    `db:"svc_version"`
	Engine         string    `db:"engine"`
	Address        string    `db:"address"`
	Key            string    `db:"key"`
	ErrorWhen      *string   `db:"error_when"`
	ErrorMessage   *string   `db:"error_message"`
	StackTrace     *string   `db:"stack_trace"`
	ObtainDuration int       `db:"obtain_duration"`
	Duration       int       `db:"duration"`
	StartedAt      time.Time `db:"started_at"`
	FinishedAt     time.Time `db:"finished_at"`
}
