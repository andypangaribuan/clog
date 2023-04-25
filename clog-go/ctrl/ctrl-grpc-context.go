/*
 * Copyright (c) 2023.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

package ctrl

import (
	"fmt"

	"github.com/andypangaribuan/project9/p9"
	"github.com/lib/pq"
)

type srGrpcContext struct{}

var grpcContext *srGrpcContext

func init() {
	grpcContext = &srGrpcContext{}
}

// SetError
func (slf *srGrpcContext) SetError(obj interface{}, err error, messages ...string) {
	id := "1"
	message, status := slf.getErrorMessage(err, messages...)

	err = p9.Util.ReflectionSet(obj, map[string]interface{}{
		"Status": status,
		"ErrId":  id,
		"ErrMsg": message,
	})

	if err != nil {
		panic(err)
	}
}

func (*srGrpcContext) getErrorMessage(err error, messages ...string) (string, string) {
	status := "error"
	message := "unknown error"

	if len(messages) > 0 {
		msg := messages[0]
		if msg == "success" || msg == "failed" || msg == "error" {
			status = msg
			messages = append(messages[:0], message[1:])
		}
	}

	if len(messages) > 0 {
		message = messages[0]
	}

	if err != nil {
		if len(messages) > 0 {
			message += "\n"
		}

		message += fmt.Sprintf("%v", err)
		if e, ok := err.(*pq.Error); ok {
			if e.Hint != "" {
				message += "\n" + e.Hint
			}
		}
	}

	return message, status
}
