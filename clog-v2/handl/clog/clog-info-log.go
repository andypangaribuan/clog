/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package clog

import (
	"clog/db/entity"
	"clog/db/repo"
	"clog/res/proto/generated/sclog"
	"fmt"
)

func (slf *stuClog) infoLog(req *sclog.RequestInfoLog, header map[string]string) (*sclog.Response, error) {
	for key, val := range header {
		fmt.Printf("%v: %v\n", key, val)
	}

	err := repo.DbqLog.Insert(&entity.DbqLog{
		Uid: req.Uid,
	})

	return send(err)
}
