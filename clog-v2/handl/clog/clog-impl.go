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

func (slf *stuClog) InfoLogV1(ctx context.Context, req *sclog.RequestInfoLogV1) (*sclog.Response, error) {
	return slf.infoLogV1(req, fm.GrpcHeader(ctx))
}
