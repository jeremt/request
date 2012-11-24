request
=======

Simple Dart class to perform easier HttpRequest.

Example
-------

```dart

import 'package:request/request.dart';

void main() {
  req.get('http://graph.facebook.com/124179747737258/photos', (res) {
    print(req.data);
  });
}

```

API
---

### Request#set(String key, String value)

Set request header.

### Request#route(String method, String url, var data, [Function cb]) {

Perform http request for specific [method], [route] and optional [data].

### Request#get(String url, var data, [Function cb])

Perform GET request.

### Request#post(String url, var data, [Function cb])

Perform POST request.

### Request#put(String url, var data, [Function cb])

Perform PUT request.

### Request#del(String url, var data, [Function cb])

Perform DELETE request.

TODO
----
- Chain methods: `req.get('/', (res) => print(res))..post('/users/2', {'name':'toto'});`
- add `type(key, value)` method to set application type
- add `data(key, value)` method to add more data into the request.
- add `auth(login, password)` method for ssh connect.
- add `file(type, path...)` method to upload files.
- add `on(event, cb)` method to listening on HTTPRequest events.

License
-------
(The MIT License)

Copyright (c) 2012 Jeremie T. <taboada.jeremie@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.