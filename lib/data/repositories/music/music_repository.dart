import 'dart:convert';
import 'dart:developer';

import 'package:test_app/data/models/music/music_entity.dart';
import 'package:test_app/data/repositories/music/music_network_service.dart';


// repo layer: translate this to a real model.
// takes json data converts it to dart Model.

class MusicRepository {
  final MusicNetworkService networkService;

  MusicRepository({required this.networkService});

  Future<List<MusicEntity>> getMusic() async {
    // throw Exception("It's LiiT");
    final music = await networkService.getMusic();
    final data = music.body;
    final jsonData = jsonDecode(data) as List;
    return jsonData.map((e) => MusicEntity.fromJson(e)).toList();
  }

  Future<bool> deleteMusic(int selectedId) async {
    try {
      await networkService.deleteMusic(selectedId);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
