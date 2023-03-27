/*
 * Copyright (c) 2023.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of private_ctrl;

class _GetDbIpHandler extends FuseHandler {
  @override
  Future<FuseResponse> handler(FuseContext ctx) async {
    final res = await app.db.select(sql: 'SELECT host(inet_server_addr())');
    if (res.err.isError) {
      return ctx.raw(500, res.err.stackTrace?.toString() ?? 'unknown');
    }

    if (res.rows.isEmpty) {
      return ctx.raw(400, "empty data");
    }

    final ip = res.rows[0].get<String>('host', defaultValue: '-');
    return ctx.raw(200, ip!);
  }
}
