/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package app

import (
	"github.com/andypangaribuan/gmod/ice"
	qdb "github.com/questdb/go-questdb-client/v3"
)

var (
	Db      ice.DbInstance
	QdbPool *qdb.LineSenderPool
	Env     *stuEnv
)
