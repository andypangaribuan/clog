/*
 * Copyright (c) 2023.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

package repo

var (
	DbqLog     *srDbqLog
	InfoLog    *srInfoLog
	ServiceLog *srServiceLog
)

func init() {
	DbqLog = srDbqLog{}.new()
	InfoLog = srInfoLog{}.new()
	ServiceLog = srServiceLog{}.new()
}
