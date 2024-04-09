/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package test

import (
	"clog/res/proto/generated/sclog"
	"testing"

	"github.com/andypangaribuan/gmod/fm"
	"github.com/andypangaribuan/gmod/gm"
	"github.com/stretchr/testify/require"
)

func TestClogDbqInfo(t *testing.T) {
	start(t, doTestClogDbqInfo)
}

func doTestClogDbqInfo(t *testing.T) {
	// conn, err := gm.Net.GrpcConnection(env.ClogGrpcAddress)
	// require.Nil(t, err)

	// c := sclog.NewCLogServiceClient(conn)

	// c, err := _create(env.ClogGrpcAddress, sclog.NewCLogServiceClient)
	c, err := fm.GrpcClient(env.ClogGrpcAddress, sclog.NewCLogServiceClient)
	require.Nil(t, err)

	res, err := fm.GrpcCall(c.InfoLog,
		&sclog.RequestInfoLog{
			Uid: gm.Util.UID(),
		}, map[string]string{
			"key1": "val1",
			"key2": "val2",
		})

	// res, err := call(c.InfoLog,
	// 	&sclog.RequestInfoLog{
	// 		Uid: gm.Util.UID(),
	// 	}, map[string]string{
	// 		"key1": "val1",
	// 		"key2": "val2",
	// 	})

	require.Nil(t, err)

	printf(t, "status: %v, message: %v\n", res.Status, res.Message)
}

// func call[T any, R any](fn func(ctx context.Context, in *T, opts ...grpc.CallOption) (*R, error), req *T, header ...map[string]string) (*R, error) {
// 	ctx := context.Background()
// 	if len(header) > 0 && len(header[0]) > 0 {
// 		ctx = metadata.NewOutgoingContext(ctx, metadata.New(header[0]))
// 	}

// 	return fn(ctx, req)
// }

// func _create[T any](address string, fn func(cc grpc.ClientConnInterface) T) (T, error) {
// 	var client T

// 	conn, err := gm.Net.GrpcConnection(address)
// 	if err != nil {
// 		return client, err
// 	}

// 	return fn(conn), nil
// }
