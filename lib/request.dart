
/**
 * Simple class to perform easier HttpRequest.
 */

library request;

import 'dart:html';
import 'dart:json';
import 'dart:uri';

class Request {

  /**
   * HttpRequest.
   */

  HttpRequest _req;

  /**
   * Request types.
   */

  Map _types = {
    'html': 'text/html',
    'json': 'application/json',
    'urlencoded': 'application/x-www-form-urlencoded',
    'form': 'application/x-www-form-urlencoded',
    'form-data': 'application/x-www-form-urlencoded'
  };

  /**
   * Initialize a new request.
   */

  Request() {
    _req = new HttpRequest();
  }

  /**
   * Return a [Map] from request [responseText].
   */

  Map get data() => JSON.parse(_req.responseText);

  /**
   * Return the request status.
   */

  Map get status() => _req.status;

  /**
   * Return the text result
   */

  String get text() => _req.responseText;

  /**
   * Add request header.
   */

  void set(String key, String value) {
    _req.setRequestHeader(key, value);
  }

  /**
   * Encode [Map] to send params into request.
   */

  String _encode(Map data) {
    return Strings.join(data.keys.map((k) {
      return '${encodeUriComponent(k)}=${encodeUriComponent(data[k])}';
    }), '&');
  }

  /**
   * Perform http request for specific [method], [route] and optional [data].
   */

  void route(String method, String url, var data, [Function cb]) {
    if (cb == null) {
      cb = data;
      data = null;
    } else {
      data = _encode(data);
    }

    if (method == 'GET' && data != null) // add data in get params
      url = "$url?$data";
    else if (data != null) // send data into request body
      header('Content-type', 'application/x-www-form-urlencoded');

    _req.open(method, url);
    _req.on.loadEnd.add((e) => cb(this));
    _req.send(data);
  }

  /**
   * Perform GET request.
   */

  void get(String url, var data, [Function cb]) {
    route('GET', url, data, cb);
  }

  /**
   * Perform POST request.
   */

  void post(String url, var data, [Function cb]) {
    route('POST', url, data, cb);
  }

  /**
   * Perform PUT request.
   */

  void put(String url, var data, [Function cb]) {
    route('PUT', url, data, cb);
  }

  /**
   * Perform DELETE request.
   */

  void del(String url, var data, [Function cb]) {
    route('DELETE', url, data, cb);
  }

}