/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:clog/server.dart';
import 'package:fdark/fdark.dart';
import 'package:fdation/fdation.dart';

import 'controller/controller.dart';

Future<void> main(List<String> args) async {
  await fd.env.load(args);
  initAPI();
  initDB();
}

void initAPI() {
  final restPort = fd.env.get<int>('REST_PORT', defaultValue: 9000)!;
  FuseAPI(restPort: restPort).serve(routes: _routes);
  print('rest api listening on port $restPort');
}

void initDB() {
  db.initialize(
    host: fd.env.get('DB_HOST'),
    port: fd.env.get<int>('DB_PORT')!,
    name: fd.env.get('DB_NAME'),
    scheme: fd.env.get('DB_SCHEME'),
    user: fd.env.get('DB_USERNAME'),
    password: fd.env.get('DB_PASSWORD'),
    settings: FConnectionSettings(
      maxIdle: fd.env.get<int>('DB_MAX_IDLE')!,
      maxOpen: fd.env.get<int>('DB_MAX_OPEN')!,
      idleLifetime: Duration(minutes: fd.env.get<int>('DB_IDLE_LIFETIME')!),
      openLifetime: Duration(minutes: fd.env.get<int>('DB_OPEN_LIFETIME')!),
    ),
  );
}

void _routes(FuseRouter router) {
  router.setHandlerAuthX(ctrl.auth.user);

  router.add("get: /hello", ctrl.server.getTime, withAuthX: true);
}
