part of 'music_cubit.dart';

sealed class MusicState extends Equatable {
  const MusicState();

  @override
  List<Object?> get props => [];
}

final class MusicInitialState extends MusicState {
  final String? initialMessage;

  const MusicInitialState({this.initialMessage});

  @override
  List<Object?> get props => [initialMessage];
}

final class MusicLoadingState extends MusicState {
  @override
  List<Object> get props => [];
}

final class MusicLoadedState extends MusicState {
  final List<MusicEntity> music;
  const MusicLoadedState({required this.music});
  @override
  List<Object> get props => [music];
}

final class MusicErrorState extends MusicState {
  final String errorMessage;
  const MusicErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
