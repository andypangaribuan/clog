/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

library clog_service;

import 'package:clog/db/entity/dbq_log_entity.dart';
import 'package:clog/db/entity/info_log_entity.dart';
import 'package:clog/db/entity/service_log_entity.dart';
import 'package:clog/db/repo/repo.dart';
import 'package:clog/proto/clog.pbgrpc.dart';
import 'package:clog/proto/extension.dart';
import 'package:fdation/fdation.dart';
import 'package:grpc/grpc.dart' as grpc;

part 'dbq_log_handler.dart';
part 'info_log_handler.dart';
part 'service_log_handler.dart';

class CLogService extends CLogServiceBase {
  @override
  Future<Response> infoLog(grpc.ServiceCall call, RequestInfoLog request) {
    return infoLogHandler(request);
  }

  @override
  Future<Response> serviceLog(grpc.ServiceCall call, RequestServiceLog request) {
    return serviceLogHandler(request);
  }
  
  @override
  Future<Response> dbqLog(grpc.ServiceCall call, RequestDbqLog request) {
    return dbqLogHandler(request);
  }
}
