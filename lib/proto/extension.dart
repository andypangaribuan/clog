/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'google/protobuf/wrappers.pb.dart';

extension StringValueExt on StringValue {
  String? get val => hasValue() ? value : null;
}

extension Int64ValueExt on Int64Value {
  BigInt? get val => !hasValue() ? null : BigInt.parse(value.toString());
}

extension Int32ValueExt on Int32Value {
  int? get val => !hasValue() ? null : value.toInt();
}
