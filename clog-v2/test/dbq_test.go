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
	"testing"
	"time"

	"github.com/andypangaribuan/gmod/clog"
	"github.com/andypangaribuan/gmod/fm"
	"github.com/andypangaribuan/gmod/gm"
	"github.com/andypangaribuan/gmod/grpc/service/sclog"
	"github.com/stretchr/testify/require"
	"google.golang.org/protobuf/types/known/wrapperspb"
)

func TestClogDbq(t *testing.T) {
	start(t, func(t *testing.T) {
		logc := clog.New()
		c, err := fm.GrpcClient(env.ClogGrpcAddress, sclog.NewCLogServiceClient)
		require.Nil(t, err)

		timenow := gm.Util.Timenow()
		after := timenow.Add(time.Second * 2)

		req := &sclog.RequestDbqV1{
			Uid:        gm.Util.UID(),
			UserId:     &wrapperspb.StringValue{Value: "xyz"},
			Duration2:  &wrapperspb.Int32Value{Value: 101},
			StartedAt:  gm.Conv.Time.ToStrFull(timenow),
			FinishedAt: gm.Conv.Time.ToStrFull(after),
		}

		res, err := fm.GrpcCall(logc, c.DbqV1, req,
			map[string]string{
				"key1": "val1",
				"key2": "val2",
			})

		require.Nil(t, err)

		printf(t, "status: %v, message: %v\n", res.Status, res.Message)
	})
}
