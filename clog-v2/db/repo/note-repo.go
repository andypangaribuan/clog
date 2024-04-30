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

var Note *stuRepo[entity.Note]

func init() {
	add(func(dbi ice.DbInstance) {
		Note = new(dbi, "note", `
					created_at, uid,
					exec_path, exec_function, key, sub_key, data`,
			func(e *entity.Note) []any {
				return []any{
					e.CreatedAt, e.Uid,
					e.ExecPath, e.ExecFunction, e.Key, e.SubKey, e.Data,
				}
			})
	})
}
