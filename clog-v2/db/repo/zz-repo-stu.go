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

type stuRepo[T any] struct {
	repo db.Repo[T]
	xrepo[T]
}
