/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package main

import (
	"clog/app"
	_ "clog/db/repo"
	"clog/handl"

	"github.com/andypangaribuan/gmod/fm"
	"github.com/andypangaribuan/gmod/grpc/service/sclog"
	"github.com/andypangaribuan/gmod/server"
)

func main() {
	fm.CallOrderedInit()
	server.FuseG(app.Env.GrpcPort, grpc)
}

func grpc(router server.RouterG) {
	router.AutoRecover(app.Env.AppAutoRecover)
	router.RunHealthCheck()
	sclog.RegisterCLogServiceServer(router.Server(), handl.Clog)
}
