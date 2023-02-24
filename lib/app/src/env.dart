/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of app_lib;

class _AppEnv extends AbsAppEnv {
  _AppEnv() {
    appName = 'clog';
    appVersion = fd.env.get<String>('APP_VERSION', defaultValue: 'unknown')!;
    appRestPort = fd.env.get<int>('APP_REST_PORT')!;
    appGrpcPort = fd.env.get<int>('APP_GRPC_PORT')!;

    db = _AppEnvDB();
  }
}

class _AppEnvDB extends AbsAppEnvDB {
  _AppEnvDB() {
    host = fd.env.get('DB_HOST');
    port = fd.env.get<int>('DB_PORT')!;
    name = fd.env.get('DB_NAME');
    user = fd.env.get('DB_USER');
    pass = fd.env.get('DB_PASS');
    scheme = fd.env.get('DB_SCHEME');

    maxIdle = fd.env.get<int>('DB_MAX_IDLE')!;
    maxOpen = fd.env.get<int>('DB_MAX_OPEN')!;
    idleLifetime = Duration(minutes: fd.env.get<int>('DB_IDLE_LIFETIME')!);
    openLifetime = Duration(minutes: fd.env.get<int>('DB_OPEN_LIFETIME')!);
  }
}
