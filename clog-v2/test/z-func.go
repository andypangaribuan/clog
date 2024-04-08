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
	"fmt"
	"log"
	"testing"
)

func printf(t *testing.T, format string, args ...interface{}) {
	message := fmt.Sprintf(format, args...)
	if t != nil {
		t.Logf(message)
	}
	log.Print(message)
}
