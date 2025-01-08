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
	"clog/app"
)

func (slf *xrepo[T]) Insert(e *T) error {
	if app.Env.DbType == "-" {
		return nil
	}

	if app.Env.DbType == "questdb" {
		return slf.qdbInsert(e)
	}

	return slf.repo.Insert(nil, e)
}
