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
	"clog/app"
	"context"
	"fmt"
)

func (slf *xrepo[T]) chInsert(e *T) error {
	var (
		ctx    = context.Background()
		values = slf.fn(e)
	)

	query := fmt.Sprintf("INSERT INTO %v (%v) VALUES (%v)", slf.tableName, slf.chColumns, slf.chArgs)
	return app.ChDb.AsyncInsert(ctx, query, true, values...)
}
