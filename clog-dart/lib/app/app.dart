/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

library app_lib;

import 'package:fdation/fdation.dart';

import 'abs.dart';
import 'src/abs.dart';

part 'src/env.dart';

final app = _App();

class _App extends AbsApp {
  _App() {
    env = _AppEnv();
    net = Net();
  }
}
