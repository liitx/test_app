import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/data/models/music/music_entity.dart';
import 'package:test_app/data/repositories/music/music_repository.dart';


part 'music_state.dart';

class MusicCubit extends Cubit<MusicState> {
  final MusicRepository musicRepository;
  int _deletedMusicId = 0;

  MusicCubit({required this.musicRepository})
      : super(const MusicInitialState(initialMessage: 'No Music in Library'));

  Future<List<MusicEntity>?> getMusic() async {
    try {
      final music = await musicRepository.getMusic();
      if (_deletedMusicId >= 0) {
        music.removeWhere((musicModel) => musicModel.id == _deletedMusicId);
      }
      // emit(MusicLoadingState());
      emit(const MusicInitialState());
      emit(MusicLoadingState());

      if (music != null) {
        emit(MusicLoadedState(music: music));
      } else {
        emit(const MusicErrorState(errorMessage: 'cannot get music'));
      }
    } catch (e) {
      log('TryCatch000');
      log('MusicCubit get catch: ${e.toString()}');
      emit(MusicErrorState(errorMessage: e.toString()));
    }
    return null;
  }

  Future<bool> deleteMusic(int id) async {
    try {
      // emit(MusicLoadedState(music: music))
      musicRepository.deleteMusic(id);
      _deletedMusicId = id;
      getMusic();
      log('DELETED MUSIC SUCCESSFUL');
      return true;
    } catch (e) {
      return false;
    }
  }
}