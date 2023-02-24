/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

abstract class AbsAppEnv {
  late final String appName;
  late final String appVersion;
  late final int appRestPort;
  late final int appGrpcPort;

  late final AbsAppEnvDB db;
}

abstract class AbsAppEnvDB {
  late final String host;
  late final int port;
  late final String name;
  late final String user;
  late final String pass;
  late final String scheme;

  late final int maxIdle;
  late final int maxOpen;
  late final Duration idleLifetime;
  late final Duration openLifetime;
}
