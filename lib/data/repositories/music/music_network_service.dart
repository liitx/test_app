import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MusicNetworkService {
  // final baseUrl = 'jsonplaceholder.typicode.com';
  final baseUrl = 'https://api.publicapis.org/entries';

  Future<Response> getMusic() async {
    late final Response
        response; // late: it's going to be assigned later, which later it will not be null.
    try {
      final uri = Uri.https(baseUrl, '/music');
      response = await http.get(uri);
    } catch (e) {
      log('NetworkService fetch catch: ${e.toString()}');
    }
    return response;
  }

  Future<Response> deleteMusic(int id) async {
    late final Response
        response; // late: it's going to be assigned later, which later it will not be null.
    try {
      final uri = Uri.https(baseUrl, '/music/$id');
      log(id.toString());
      response = await http.delete(uri);
    } catch (e) {
      log('NetworkService delete catch: ${e.toString()}');
    }
    return response;
  }
}
