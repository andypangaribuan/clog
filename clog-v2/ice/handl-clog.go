/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package ice

import (
	"clog/res/proto/generated/sclog"
	"context"
)

type HandlCLog interface {
	InfoLogV1(context.Context, *sclog.RequestInfoLogV1) (*sclog.Response, error)
	mustEmbedUnimplementedCLogServiceServer()
}
