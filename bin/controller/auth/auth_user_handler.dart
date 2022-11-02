/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of auth_ctrl;

class _DoUserHandler extends FuseAuthHandler {
  @override
  Future<FuseAuthResponse> handler(FuseAuthContext ctx) async {
    return ctx.ok('auth-user');
  }
}
