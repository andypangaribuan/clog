/*
 * Copyright (c) 2023.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

/* spell-checker: disable */
package private

import (
	getsvcname "clog/ctrl/private/get-svc-name"
	getsvcversion "clog/ctrl/private/get-svc-version"
	svccheck "clog/ctrl/private/svc-check"

	"github.com/andypangaribuan/project9/server"
)

type PrivateCtrl struct{}

func (slf *PrivateCtrl) GetSvcName(ctx server.FuseContext) error {
	return getsvcname.New(ctx)()
}

func (slf *PrivateCtrl) GetSvcVersion(ctx server.FuseContext) error {
	return getsvcversion.New(ctx)()
}

func (slf *PrivateCtrl) SvcCheck(ctx server.FuseContext) error {
	return svccheck.New(ctx)()
}
