import 'dart:io';

import 'package:http/http.dart';
import 'package:test/test.dart';

void main() {
  final port = '8080';
  final host = 'http://0.0.0.0:$port';
  late Process process;

  setUp(() async {
    process = await Process.start(
      'dart',
      ['run', 'bin/server.dart'],
      environment: {'PORT': port},
    );
    // Wait for server to start and print to stdout.
    await process.stdout.first;
  });

  tearDown(() => process.kill());

  test('app-name', () async {
    final response = await get(Uri.parse('$host/private/app-name'));
    expect(response.statusCode, 200);
  });
}
