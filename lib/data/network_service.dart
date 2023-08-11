import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class NetworkService {
  final baseUrl = 'jsonplaceholder.typicode.com';

  Future<List<dynamic>> fetchPost() async {
    try {
      final uri = Uri.https(baseUrl, '/posts');
      final response = await http.get(uri);
      return jsonDecode(response.body) as List;
    } catch (e) {
      log('NetworkService fetch catch: ${e.toString()}');
      return [];
    }
  }

  Future<List<dynamic>> deletePost(String postId) async {
    try {
      final uri = Uri.https(baseUrl, '/post/$postId');
      log(postId.toString());
      final response = await http.delete(uri);
      return jsonDecode(response.body) as List;
    } catch (e) {
      log('NetworkService delete catch: ${e.toString()}');
      return [];
    }
  }
}
