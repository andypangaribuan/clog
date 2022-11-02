/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

// ignore: depend_on_referenced_packages
import 'package:hotreloader/hotreloader.dart';

import 'server.dart' as rs;

void main(List<String> args) async {
  final reloader = await HotReloader.create();
  await rs.main(args);
  reloader.stop();
}
