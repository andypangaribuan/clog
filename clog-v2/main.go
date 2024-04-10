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
	_ "clog/db/repo"

	"clog/app"
	"clog/handl"
	"clog/res/proto/generated/sclog"

	"github.com/andypangaribuan/gmod/fm"
	"github.com/andypangaribuan/gmod/server"
)

func main() {
	fm.CallOrderedInit()
	server.FuseG(app.Env.GrpcPort, grpc)
}

func grpc(router server.RouterG) {
	router.AutoRecover(app.Env.AppAutoRecover)
	sclog.RegisterCLogServiceServer(router.Server(), handl.Clog)
}
