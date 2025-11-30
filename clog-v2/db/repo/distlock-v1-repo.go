/*
 * Copyright (c) 2025.
 * Created by Andy Pangaribuan (iam.pangaribuan@gmail.com)
 * https://github.com/apangaribuan
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package repo

import (
	"clog/db/entity"

	"github.com/andypangaribuan/gmod/ice"
)

var DistLockV1 *stuRepo[entity.DistLockV1]

func init() {
	add(func(dbi ice.DbInstance) {
		DistLockV1 = new(dbi, "distlock_v1", `
				created_at, uid,
				user_id, partner_id, svc_name, svc_version, engine,
				address, key, error_when, error_message, stack_trace,
				duration, started_at, finished_at`,
			func(e *entity.DistLockV1) []any {
				return []any{
					e.CreatedAt, e.Uid,
					e.UserId, e.PartnerId, e.SvcName, e.SvcVersion, e.Engine,
					e.Address, e.Key, e.ErrorWhen, e.ErrorMessage, e.StackTrace,
					e.Duration, e.StartedAt, e.FinishedAt,
				}
			})
	})
}
