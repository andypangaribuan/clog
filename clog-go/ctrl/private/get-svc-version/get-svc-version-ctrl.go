/*
 * Copyright (c) 2023.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

/* cspell: disable-next-line */
package getsvcversion

import (
	"clog/app"
	"net/http"

	"github.com/andypangaribuan/project9/server"
)

type srController struct {
	ctx server.FuseContext
}

func New(ctx server.FuseContext) func() error {
	sr := &srController{
		ctx: ctx,
	}
	return sr.handler
}

func (slf *srController) handler() error {
	return slf.sendResponse()
}

func (slf *srController) sendResponse() error {
	return slf.ctx.RString(nil, http.StatusOK, app.Env.AppVersion)
}
