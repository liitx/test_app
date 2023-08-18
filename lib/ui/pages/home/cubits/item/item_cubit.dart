import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/data/models/item/item_entity.dart';
import 'package:test_app/data/repositories/item/item_repository.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  final ItemRepository itemRepository;

  ItemCubit({required this.itemRepository})
      : super(const ItemInitialState(initialMessage: 'No Items found'));

  Future<ItemEntity?> getItem() async {
    try {
      final item = await itemRepository.getItem();

      emit(const ItemInitialState());
      // emit(ItemLoadingState());

      // itemRepository.getItems().then((items) {
        if (item != null) {
          emit(ItemLoadingState());
          emit(ItemLoadedState(item: item));
        } else {
          emit(const ItemErrorState(errorMessage: 'cannot get items'));
        }
      // });
    } catch (e) {
      log('TryCatch000');
      log('ItemCubit get catch: ${e.toString()}');
      emit(ItemErrorState(errorMessage: e.toString()));
    }
    return null;
  }
}



// import 'dart:developer';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:test_app/data/models/item/item_entity.dart';
// import 'package:test_app/data/repositories/item/item_repository.dart';

// part 'item_state.dart';

// class ItemCubit extends Cubit<ItemState> {
//   ItemRepository itemRepository;
//   ItemCubit({required this.itemRepository})
//       : super(const ItemInitialState(initialMessage: 'No Items'));

//   Future<List<ItemEntity>?> getItem() async {
//     try {
//       final items = await itemRepository.getItems();
//       emit(const ItemInitialState());
//       emit(ItemLoadingState());
//       // itemRepository.getItems().then((items) {
//       if (items != null) {
//         // emit(ItemLoadingState());
//         emit(ItemLoadedState(items: items));
//       } else {
//         emit(const ItemErrorState(errorMessage: 'cannot fetch items'));
//       }
//       ;
//     } catch (e) {
//       log('TryCatch000');
//       log('ItemCubit get catch: ${e.toString()}');
//       emit(ItemErrorState(errorMessage: e.toString()));
//     }
//     return null;
//   }
// }
