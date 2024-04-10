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

	"github.com/andypangaribuan/gmod/fm"
	"github.com/andypangaribuan/gmod/ice"
)

func init() {
	fm.OrderedInit(fm.OrderedLevelRepo, func() {
		for _, fn := range callbacks {
			fn(app.Db)
		}
	})
}

func add(callback func(dbi ice.DbInstance)) {
	mx.Lock()
	defer mx.Unlock()
	callbacks = append(callbacks, callback)
}
