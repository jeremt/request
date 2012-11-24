
/**
 * Simple class to perform easier HttpRequest.
 */

library request;

import 'dart:html';
import 'dart:json';
import 'dart:uri';

class Request {

  HttpRequest _req;

  /**
   * Initialize a new request.
   */

  Request() {
    _req = new HttpRequest();
  }

  /**
   * Return a [Map] from request [responseText].
   */

  Map get data() {
    return JSON.parse(_req.responseText);
  }

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
    _req.on.loadEnd.add(cb);
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