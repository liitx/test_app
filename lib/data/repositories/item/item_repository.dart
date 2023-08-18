import 'dart:convert';

import 'package:test_app/data/models/item/item_entity.dart';
import 'package:test_app/data/repositories/item/item_network_service.dart';

// repo layer: translate this to a real model.
// takes json data converts it to dart Model.

class ItemRepository {
  final ItemNetworkService networkService;

  ItemRepository({required this.networkService});

  Future<ItemEntity> getItem() async {
    try {
      // throw Exception("It's LiiT");
      final item = await networkService.getItem();
      final data = item.body;
      final temp = jsonDecode(data);
      return ItemEntity(itemId: temp["itemId"], q:temp["q"]);
      // return jsonDecode(data) as ItemEntity;
      // final temp = jsonData.map((e) => ItemEntity.fromJson(e));
      // return temp;
    } catch (e) {
      return ItemEntity(itemId: 1, q: 'FAKE');
    }
  }
}
