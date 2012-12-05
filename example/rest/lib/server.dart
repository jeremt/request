
library server;

import "dart:io";
import "dart:json";

class Server {

  /**
   * Initialize new HttpServer.
   */

  HttpServer _server;

  Server() {
    _server = new HttpServer();
    _server.defaultRequestHandler = _defaultHandler;
  }

  /**
   * Serve client files in `basePath`.
   */

  void _start(String basePath) {
    _server.addRequestHandler(_route, (HttpRequest req, HttpResponse res) {
      File file = new File(req.path == "/" ? ".$basePath/index.html" : ".$basePath/${req.path}");
      print('${req.method} ${req.path}');
      if (file.existsSync())
        return file.openInputStream().pipe(res.outputStream);
      _defaultHandler(req, res);
    });
  }

  /**
   * Simple default handling when route cannot be resolved.
   */

  void _defaultHandler(HttpRequest req, HttpResponse res) {
    res.outputStream.writeString('Cannot GET ${req.path}');
    res.outputStream.close();
  }

  /**
   * Listening on `port`.
   */

  void listen([int port = 3000]) {
    _start();
    _server.listen('127.0.0.1', port);
  }

}