/*
 * Copyright (c) 2023.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of private_ctrl;

class _GetAppVersionHandler extends FuseHandler {
  @override
  Future<FuseResponse> handler(FuseContext ctx) async {
    return ctx.ok(app.env.appVersion);
  }
}
