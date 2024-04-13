/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package entity

type ServiceV1 struct {
	Uid string `db:"uid"`
	UserId *string `db:"userId"`
	PartnerId *string `db:"partnerId"`
	SvcName string `db:"svcName"`
	SvcVersion string `db:"svcVersion"`
	SvcParent *string `db:"svcParent"`
	Endpoint string `db:"endpoint"`
	Url string `db:"url"`
	Severity string `db:"severity"`
	Path string `db:"path"`
	Function string `db:"function"`
	ReqVersion *string `db:"reqVersion"`
	ReqHeader *string `db:"reqHeader"`
	ReqParam *string `db:"reqParam"`
	ReqQuery *string `db:"reqQuery"`
	ReqForm *string `db:"reqForm"`
}