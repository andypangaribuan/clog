/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

library private_ctrl;

import 'dart:convert';

import 'package:clog/app/app.dart';
import 'package:fdark/fdark.dart';
import 'package:fdation/fdation.dart';

part 'private/get_app_name_handler.dart';
part 'private/get_app_version_handler.dart';
part 'private/get_server_time_handler.dart';
part 'private/do_service_check_handler.dart';
part 'private/get_db_ip_handler.dart';

class PrivateController {
  static final instance = PrivateController._();

  PrivateController._();

  FFuseHandler get getAppName => () => _GetAppNameHandler();
  FFuseHandler get getAppVersion => () => _GetAppVersionHandler();
  FFuseHandler get getServerTime => () => _GetServerTimeHandler();
  FFuseHandler get doServiceCheck => () => _ServiceCheckHandler();
  FFuseHandler get getDbIp => () => _GetDbIpHandler();
}
