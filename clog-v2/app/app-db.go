/*
 * Copyright (c) 2024.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package app

import (
	"context"
	"fmt"
	"log"
	"net"
	"time"

	"github.com/ClickHouse/clickhouse-go/v2"
	"github.com/andypangaribuan/gmod/gm"
	"github.com/andypangaribuan/gmod/mol"
)

func initDb() {
	if Env.DbType == "-" {
		return
	}

	if Env.DbType == "clickhouse" {
		conn, err := clickhouse.Open(&clickhouse.Options{
			Addr: []string{fmt.Sprintf("%v:%v", Env.DbHost, Env.DbPort)},
			Auth: clickhouse.Auth{
				Database: Env.DbName,
				Username: Env.DbUser,
				Password: Env.DbPass,
			},
			ClientInfo: clickhouse.ClientInfo{
				Products: []struct {
					Name    string
					Version string
				}{
					{Name: Env.AppName, Version: gm.Util.Env.GetString("APP_VERSION", "0.0.0")},
				},
			},
			DialContext: func(ctx context.Context, addr string) (net.Conn, error) {
				var d net.Dialer
				return d.DialContext(ctx, "tcp", addr)
			},
			Settings: clickhouse.Settings{
				"max_execution_time": 60,
			},
			Compression: &clickhouse.Compression{
				Method: clickhouse.CompressionLZ4,
			},
			DialTimeout:          time.Second * 30,
			MaxOpenConns:         3,
			MaxIdleConns:         3,
			ConnMaxLifetime:      time.Duration(10) * time.Minute,
			ConnOpenStrategy:     clickhouse.ConnOpenInOrder,
			BlockBufferSize:      10,
			MaxCompressionBuffer: 10240,
		})

		if err != nil {
			log.Fatalf("%+v\n", err)
		}

		if err := conn.Ping(context.Background()); err != nil {
			if ex, ok := err.(*clickhouse.Exception); ok {
				log.Fatalf("exception [%d] %s \n%s\n", ex.Code, ex.Message, ex.StackTrace)
			}

			log.Fatalf("error when ping\n%+v\n", err)
		}

		ChDb = conn
		return
	}

	conn := mol.DbConnection{
		AppName:  Env.AppName,
		Host:     Env.DbHost,
		Port:     Env.DbPort,
		Name:     Env.DbName,
		Username: Env.DbUser,
		Password: Env.DbPass,
	}

	Db = gm.Db.Postgres(conn)
}
