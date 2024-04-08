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
)

func (slf *stuClog) InfoLog(ctx context.Context, req *sclog.RequestInfoLog) (*sclog.Response, error) {
	return slf.send(nil)
}
