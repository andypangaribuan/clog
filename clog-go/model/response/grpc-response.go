/*
 * Copyright (c) 2023.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

package response

import "clog/abs"

type GrpcResponse[T any] struct {
	value T
	ctx   abs.GRPCContext
}

func (slf GrpcResponse[T]) New(ctx abs.GRPCContext, value T) *GrpcResponse[T] {
	slf.ctx = ctx
	slf.value = value
	return &slf
}

func (slf *GrpcResponse[T]) Send() (T, error) {
	return slf.value, nil
}

func (slf *GrpcResponse[T]) SendError(err error, message ...string) (T, error) {
	slf.ctx.SetError(slf.value, err, message...)
	return slf.value, nil
}

func (slf *GrpcResponse[T]) Value() T {
	return slf.value
}
