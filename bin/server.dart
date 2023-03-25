/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:clog/app.dart';
import 'package:clog/controller.dart';
import 'package:clog/grpc/clog_service.dart';
import 'package:clog/proto/clog.pbgrpc.dart';
import 'package:fdark/fdark.dart';
import 'package:fdation/fdation.dart';

Future<void> main(List<String> args) async {
  await fd.env.load(args);
  initDB();
  initAPI();

  final req = RequestServiceLog();
  req.hasSvcName();
}

void initDB() {
  app.db = FPostgresDB(
    host: app.env.db.host,
    port: app.env.db.port,
    name: app.env.db.name,
    user: app.env.db.user,
    password: app.env.db.pass,
    scheme: app.env.db.scheme,
    settings: FConnectionSettings(
      maxIdle: app.env.db.maxIdle,
      maxOpen: app.env.db.maxOpen,
      idleLifetime: app.env.db.idleLifetime,
      openLifetime: app.env.db.openLifetime,
    ),
  );
}

void initAPI() {
  final api = FuseAPI(restPort: app.env.appRestPort, grpcPort: app.env.appGrpcPort);
  api.restfulService(routes: _routes);
  print('rest api listening on port ${app.env.appRestPort}');

  api.grpcServices(services: [CLogService()]);
  print('grpc api listening on port ${app.env.appGrpcPort}');
}

void _routes(FuseRouter router) {
  router.add("get: /private/app-name", ctrl.private.getAppName);
  router.add("get: /private/app-version", ctrl.private.getAppVersion);
  router.add("get: /private/server-time", ctrl.private.getServerTime);
  router.add("get: /private/service-check", ctrl.private.serviceCheck);
}
