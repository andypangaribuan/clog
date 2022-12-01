/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

class InfoLogEntity {
  String id;
  String svcName;
  String? svcParent;
  String message;
  String severity; // types: info, warning, error
  String? data;
  DateTime createdAt;

  InfoLogEntity({
    required this.id,
    required this.svcName,
    this.svcParent,
    required this.message,
    required this.severity,
    required this.data,
    required this.createdAt,
  });
}