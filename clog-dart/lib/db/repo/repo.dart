/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

library db_repo;

import 'package:clog/app/app.dart';
import 'package:clog/db/entity/dbq_log_entity.dart';
import 'package:clog/db/entity/info_log_entity.dart';
import 'package:clog/db/entity/service_log_entity.dart';
import 'package:fdation/fdation.dart';

part 'src/dbq_log_repo.dart';
part 'src/info_log_repo.dart';
part 'src/service_log_repo.dart';

final repo = _Repo();

class _Repo {
  late final infoLog = _InfoLogRepo();
  late final serviceLog = _ServiceLogRepo();
  late final dbqLog = _DbqLogRepo();
}
