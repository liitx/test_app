import 'dart:convert';

import 'package:test_app/data/models/item/item_entity.dart';
import 'package:test_app/data/repositories/item/item_network_service.dart';

// repo layer: translate this to a real model.
// takes json data converts it to dart Model.

class ItemRepository {
  final ItemNetworkService networkService;

  ItemRepository({required this.networkService});

  Future<List<ItemEntity>?> getItems() async {
    try {
      // throw Exception("It's LiiT");
      final items = await networkService.getItems();
      final data = items.body;
      final jsonData = jsonDecode(data) as List;
      final temp = jsonData.map((e) => ItemEntity.fromJson(e)).toList();
      return temp;
    } catch (e) {
      return [
        ItemEntity(itemId: 1, q: 'FAKE')
      ];
    }
  }
}
