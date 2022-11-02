/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

library auth_ctrl;

import 'package:fdark/fdark.dart';

part 'auth_user_handler.dart';

class AuthController {
  FFuseAuthHandler get user => () => _DoUserHandler();
}
