/*
 * Copyright (c) 2025.
 * Created by Andy Pangaribuan (iam.pangaribuan@gmail.com)
 * https://github.com/apangaribuan
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package test

import (
	"testing"

	"github.com/andypangaribuan/gmod/clog"
	"github.com/andypangaribuan/gmod/fm"
	"github.com/andypangaribuan/gmod/gm"
	"github.com/stretchr/testify/require"
)

func TestInsertNoteV1(t *testing.T) {
	gm.Test.Start(t, func(t *testing.T) {
		var (
			logc               = clog.New()
			execPath, execFunc = gm.Util.GetExecPathFunc()
		)

		err := logc.NoteV1(&clog.NoteV1{
			ExecPath: execPath,
			ExecFunc: execFunc,
			Key:      fm.Ptr("clog-client: test insert"),
			Data:     "test insert",
		}, false)

		require.Nil(t, err)
	})
}
