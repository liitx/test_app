import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ItemNetworkService {
  final baseUrl = '127.0.0.1:8000';

  Future<Response> getItems() async {
    late final Response
        response; // late: it's going to be assigned later, which later it will not be null.
    try {
      final uri = Uri.http(baseUrl, '');
      response = await http.get(uri);
    } catch (e) {
      log('NetworkService fetch items catch: ${e.toString()}');
    }
    return response;
  }
}
