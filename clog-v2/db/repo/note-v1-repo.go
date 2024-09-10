/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
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

var Note *stuRepo[entity.NoteV1]

func init() {
	add(func(dbi ice.DbInstance) {
		Note = new(dbi, "note_v1", `
					created_at, uid,
					user_id, partner_id, svc_name, svc_version,
					exec_path, exec_function, key, sub_key, data`,
			func(e *entity.NoteV1) []any {
				return []any{
					e.CreatedAt, e.Uid,
					e.UserId, e.PartnerId, e.SvcName, e.SvcVersion,
					e.ExecPath, e.ExecFunction, e.Key, e.SubKey, e.Data,
				}
			})
	})
}
