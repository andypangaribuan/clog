/*
 * Copyright (c) 2025.
 * Created by Andy Pangaribuan <https://github.com/apangaribuan>.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

package repo

import (
	"clog/app"
	"context"
	"time"
)

func (slf *xrepo[T]) tsz(val time.Time) time.Time {
	ts := val.Format("2006-01-02T15:04:05.999999Z")
	tz, _ := time.Parse(time.RFC3339, ts)
	return tz
}

func (slf *xrepo[T]) qdbInsert(e *T) error {
	ctx := context.TODO()
	sender, err := app.QdbPool.Sender(ctx)
	if err != nil {
		return err
	}

	var (
		values        = slf.fn(e)
		symbolColumns = make(map[string]string, 0)
		stringColumns = make(map[string]string, 0)
		intColumns    = make(map[string]int64, 0)
		floatColumns  = make(map[string]float64, 0)
		timeColumns   = make(map[string]time.Time, 0)
		boolColumns   = make(map[string]bool, 0)
		shipper       = sender.Table(slf.tableName)
	)

	for i, column := range slf.qdbColumns {
		_, isSymbol := slf.qdbSymbols[column]

		switch val := values[i].(type) {
		case string:
			if isSymbol {
				symbolColumns[column] = val
			} else {
				stringColumns[column] = val
			}

		case *string:
			if val != nil {
				if isSymbol {
					symbolColumns[column] = *val
				} else {
					stringColumns[column] = *val
				}
			}

		case int:
			intColumns[column] = int64(val)

		case *int:
			if val != nil {
				intColumns[column] = int64(*val)
			}

		case int64:
			intColumns[column] = val

		case *int64:
			if val != nil {
				intColumns[column] = *val
			}

		case float32:
			floatColumns[column] = float64(val)

		case *float32:
			if val != nil {
				floatColumns[column] = float64(*val)
			}

		case float64:
			floatColumns[column] = val

		case *float64:
			if val != nil {
				floatColumns[column] = *val
			}

		case time.Time:
			timeColumns[column] = slf.tsz(val)

		case *time.Time:
			if val != nil {
				timeColumns[column] = slf.tsz(*val)
			}

		case bool:
			boolColumns[column] = val

		case *bool:
			if val != nil {
				boolColumns[column] = *val
			}
		}
	}

	for column, val := range symbolColumns {
		shipper.Symbol(column, val)
	}

	for column, val := range stringColumns {
		shipper.StringColumn(column, val)
	}

	for column, val := range intColumns {
		shipper.Int64Column(column, val)
	}

	for column, val := range floatColumns {
		shipper.Float64Column(column, val)
	}

	for column, val := range timeColumns {
		shipper.TimestampColumn(column, val)
	}

	for column, val := range boolColumns {
		shipper.BoolColumn(column, val)
	}

	err = shipper.AtNow(ctx)
	if err != nil {
		return err
	}

	// close call returns the sender back to the pool
	return sender.Close(ctx)
}
