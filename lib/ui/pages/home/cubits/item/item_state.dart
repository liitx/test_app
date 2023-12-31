part of 'item_cubit.dart';

sealed class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object?> get props => [];
}

final class ItemInitialState extends ItemState {
  final String? initialMessage;
  const ItemInitialState({this.initialMessage});

  @override
  List<Object?> get props => [initialMessage];
}

final class ItemLoadingState extends ItemState {}

final class ItemLoadedState extends ItemState {
  // final List<ItemEntity> items;
    final List<ItemEntity> items;
  const ItemLoadedState({required this.items});

  @override
  List<Object?> get props => [items];
}

final class ItemErrorState extends ItemState {
  final String errorMessage;
  const ItemErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
