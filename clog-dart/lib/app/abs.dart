/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:clog/app/src/abs.dart';
import 'package:fdark/fdark.dart';
import 'package:fdation/fdation.dart';

abstract class AbsApp {
  late final AbsAppEnv env;
  late final FDB db;
  late final Net net;
}