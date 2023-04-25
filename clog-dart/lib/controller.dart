/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

import 'package:clog/controller/private.dart';

final ctrl = _Controller();

class _Controller {
  _Controller();

  PrivateController get private => PrivateController.instance;
}
