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
	"clog/res/proto/generated/sclog"
	"context"

	"github.com/andypangaribuan/gmod/fm"
)

func (slf *stuClog) DbqLogV1(ctx context.Context, req *sclog.RequestDbqLogV1) (*sclog.Response, error) {
	return slf.dbqLogV1(req, fm.GrpcHeader(ctx))
}

func (slf *stuClog) ServicePieceLogV1(ctx context.Context, req *sclog.RequestServicePieceLogV1) (*sclog.Response, error) {
	return slf.servicePieceLogV1(req, fm.GrpcHeader(ctx))
}
