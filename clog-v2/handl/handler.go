/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package handl

import (
	"clog/handl/clog"

	"github.com/andypangaribuan/gmod/fm"
)

func init() {
	fm.OrderedInit(fm.OrderedLevelService, func() {
		Clog = clog.ServiceServer()
	})
}
