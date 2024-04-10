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
	"clog/db/repo"
	"clog/handl"
	"clog/res/proto/generated/sclog"

	"github.com/andypangaribuan/gmod/server"
)

func main() {
	repo.Make(app.Db)
	server.FuseG(app.Env.GrpcPort, grpc)
}

func grpc(router server.RouterG) {
	router.AutoRecover(app.Env.AppAutoRecover)
	sclog.RegisterCLogServiceServer(router.Server(), handl.Clog)
}
