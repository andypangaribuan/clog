/*
 * Copyright (c) 2023.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

package main

import (
	"clog/app"
	"clog/ctrl"

	clog_svc "github.com/andypangaribuan/project9/proto/clog-svc"
	"github.com/andypangaribuan/project9/server"
	"google.golang.org/grpc"
)

func main() {
	withErr := !app.Env.AppEnv.IsProd() && !app.Env.AppEnv.IsSandbox()
	server.Fuse2(app.Env.AppPortRestful, app.Env.AppPortGRPC, app.Env.AppAutoRecover, withErr, routes, register)
}

func routes(router server.FuseRouter) {
	router.Group(map[string][]func(sc server.FuseContext) error{
		"GET: /private/svc-name":    {ctrl.Private.GetSvcName},
		"GET: /private/svc-version": {ctrl.Private.GetSvcVersion},
		"GET: /private/svc-check":   {ctrl.Private.SvcCheck},
	})
}

func register(server *grpc.Server) {
	clog_svc.RegisterCLogServiceServer(server, ctrl.CLogSvc)
}
