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
	"sync"

	"github.com/andypangaribuan/gmod/ice"
)

var (
	callbacks []func(dbi ice.DbInstance)
	mx        sync.Mutex
)
