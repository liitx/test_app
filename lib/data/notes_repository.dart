import 'dart:convert';
import 'dart:developer';

import 'package:test_app/data/model/entity_post_model.dart';
import 'package:test_app/data/network_service.dart';

// repo layer: translate this to a real model.
// takes json data converts it to dart Model.

class NotesRepository {
  final NetworkService networkService;

  NotesRepository({required this.networkService});

  Future<List<EntityPostModel>> fetchPost() async {
    // throw Exception("It's LiiT");
    final post = await networkService.fetchPost();
    final data = post.body;
    final jsonData = jsonDecode(data) as List;
    return jsonData.map((e) => EntityPostModel.fromJson(e)).toList();
  }

  Future<bool> deletePost(int selectedId) async {
    try {
      await networkService.deletePost(selectedId);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
