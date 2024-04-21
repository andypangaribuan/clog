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
)

func start(t *testing.T, fn func(t *testing.T)) {
	gm.Test.Start(t, fn)
}

func printf(t *testing.T, format string, args ...any) {
	gm.Test.Printf(t, format, args...)
}
