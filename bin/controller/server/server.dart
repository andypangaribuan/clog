/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

library server_ctrl;

import 'package:clog/server.dart';
import 'package:fdark/fdark.dart';
import 'package:fdation/fdation.dart';

part 'server_get_time_handler.dart';

class ServerController {
  FFuseHandler get getTime => () => _GetTimeHandler();
}
