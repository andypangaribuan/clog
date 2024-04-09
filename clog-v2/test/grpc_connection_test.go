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

	"github.com/andypangaribuan/gmod/gm"
	"github.com/stretchr/testify/require"
)

func TestGrpcConnection(t *testing.T) {
	start(t, grpcConnection)
}

func grpcConnection(t *testing.T) {
	_, err := gm.Net.GrpcConnection(env.ClogGrpcAddress)
	require.Nil(t, err)
}
