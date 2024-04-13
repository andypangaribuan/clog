/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package entity

import "time"

type Internal struct {
	CreatedAt    time.Time `db:"created_at"`
	Uid          string    `db:"uid"`
	ExecPath     string    `db:"exec_path"`
	ExecFunction string    `db:"exec_function"`
	Data         string    `db:"data"`
	ErrorMessage string    `db:"error_message"`
	StackTrace   string    `db:"stack_trace"`
}
