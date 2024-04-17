/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package repo

import "github.com/andypangaribuan/gmod/core/db"

type xrepo[T any] struct {
	repo db.Repo[T]
}

func (slf *xrepo[T]) Insert(e *T) error {
	return slf.repo.Insert(e)
}
