import 'dart:developer';

import 'package:http/http.dart' as http;

class BackendRestApi {
  final String _apiEndpoint = 'http://10.0.2.2';
  final int _apiPort = 3000;

  Future<http.Response> get(String path) {
    final _url = '$_apiEndpoint:$_apiPort$path';
    log('get url: $_url');
    return http.get(_url);
  }

}
