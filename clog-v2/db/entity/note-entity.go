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

type Note struct {
	CreatedAt    time.Time `db:"created_at"`
	Uid          string    `db:"uid"`
	ExecPath     string    `db:"exec_path"`
	ExecFunction string    `db:"exec_function"`
	Key          *string   `db:"key"`
	SubKey       *string   `db:"sub_key"`
	Data         string    `db:"data"`
}
