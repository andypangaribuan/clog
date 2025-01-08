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

var Internal *stuRepo[entity.Internal]

func init() {
	add(func(dbi ice.DbInstance) {
		Internal = new(dbi, "internal", "", `
				created_at, uid,
				exec_path, exec_function, data, error_message, stack_trace`,
			func(e *entity.Internal) []any {
				return []any{
					e.CreatedAt, e.Uid,
					e.ExecPath, e.ExecFunction, e.Data, e.ErrorMessage, e.StackTrace,
				}
			})
	})
}
