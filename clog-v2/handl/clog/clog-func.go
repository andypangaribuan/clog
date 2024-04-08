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
	"clog/res/proto/generated/sclog"
	"fmt"
)

func (slf *stuClog) send(err error, msg ...string) (*sclog.Response, error) {
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
