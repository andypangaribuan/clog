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

	"github.com/andypangaribuan/gmod/fm"
	"github.com/andypangaribuan/gmod/gm"
	"github.com/andypangaribuan/gmod/grpc/service/sclog"
)

func (slf *stuClog) note(req *sclog.RequestNote, _ map[string]string) (*sclog.Response, error) {
	e := &entity.Note{
		CreatedAt:    gm.Util.Timenow(),
		Uid:          req.Uid,
		ExecPath:     req.ExecPath,
		ExecFunction: req.ExecFunction,
		Key:          fm.DirectPbwGet[string](req.Key),
		SubKey:       fm.DirectPbwGet[string](req.SubKey),
		Data:         req.Data,
	}

	err := repo.Note.Insert(trimNote(e))
	saveError(err, e)

	return send(err)
}
