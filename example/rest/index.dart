/**
 * Module dependencies
 */

import 'lib/server.dart';

import 'dart:io';

void main() {
  Server server = new Server();
  server.public('/public');
  server.public('../../');
  server.listen(4242);
}