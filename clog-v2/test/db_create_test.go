/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package test

import (
	"strings"
	"testing"

	"github.com/andypangaribuan/gmod/gm"
	"github.com/stretchr/testify/require"
)

func TestDbCreate(t *testing.T) {
	start(t, dbCreate)
}

func dbCreate(t *testing.T) {
	initDb()

	execDir, err := gm.Util.GetExecDir()
	require.Nil(t, err)

	ls := strings.Split(execDir, "/")
	parentDir := strings.Join(ls[:len(ls)-1], "/")

	dbCreateTable(t, parentDir+"/res/sql/table.sql")
	dbCreateIndex(t, parentDir+"/res/sql/index.sql")
}

func dbCreateTable(t *testing.T, filePath string) {
	ls, err := gm.Util.ReadTextFile(filePath)
	require.Nil(t, err)

	sql := strings.Join(ls, "\n")
	ls = strings.Split(sql, ");")
	for _, v := range ls {
		v = strings.TrimSpace(v)
		if v != "" {
			v += "\n);"
			_, err = dbi.Execute(v)
			require.Nil(t, err)
		}
	}
}

func dbCreateIndex(t *testing.T, filePath string) {
	ls, err := gm.Util.ReadTextFile(filePath)
	require.Nil(t, err)

	sql := strings.Join(ls, "\n")
	ls = strings.Split(sql, ");")
	for _, v := range ls {
		v = strings.TrimSpace(v)
		if v != "" {
			v += ");"
			_, err = dbi.Execute(v)
			require.Nil(t, err)
		}
	}
}
