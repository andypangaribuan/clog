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

	"github.com/andypangaribuan/gmod/gm"
)

func send(err error, msg ...string) (*sclog.Response, error) {
	var (
		status  = "ok"
		message = ""
	)

	if err != nil {
		status = "!" + status
		message = fmt.Sprintf("error: %v", err.Error())
		if len(msg) > 0 {
			message = msg[0] + "\n" + message
		}
	} else if len(msg) > 0 {
		status = "!" + status
		message = msg[0]
	}

	return &sclog.Response{Status: status, Message: message}, nil
}

func saveError(err error, data any) {
	if err == nil {
		return
	}

	execPath, execFunction := gm.Util.GetExecPathFunc(1)
	jsonData, err := gm.Json.Encode(data)
	if err != nil {
		jsonData = fmt.Sprintf("%+v", data)
	}

	e := &entity.Internal{
		CreatedAt:    gm.Util.Timenow(),
		Uid:          gm.Util.UID(),
		ExecPath:     execPath,
		ExecFunction: execFunction,
		Data:         jsonData,
		ErrorMessage: err.Error(),
		StackTrace:   fmt.Sprintf("%+v", err),
	}

	repo.Internal.Insert(e)
}
