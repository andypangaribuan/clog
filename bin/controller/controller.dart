/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'auth/auth.dart';
import 'server/server.dart';

final ctrl = _Controller();

class _Controller {
  late final auth = AuthController();
  late final server = ServerController();
}
