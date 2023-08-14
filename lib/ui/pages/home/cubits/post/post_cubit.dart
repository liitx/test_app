import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/data/model/entity_post_model.dart';
import 'package:test_app/data/notes_repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final NotesRepository notesRepository;
  int _deletedPostId = 0;

  PostCubit({required this.notesRepository})
      : super(const PostInitial(initialMessage: 'No posts'));

  Future<List<EntityPostModel>?> fetchPost() async {
    try {
      final posts = await notesRepository.fetchPost();
      if (_deletedPostId >= 0) {
        posts.removeWhere((postModel) => postModel.id == _deletedPostId);
      }
      // emit(PostLoading());
      emit(const PostInitial());
      emit(PostLoading());

      if (posts != null) {
        emit(PostLoaded(post: posts));
      } else {
        emit(const PostError(errorMessage: 'cannot fetch posts'));
      }
    } catch (e) {
      log('TryCatch000');
      log('PostCubit fetch catch: ${e.toString()}');
      emit(PostError(errorMessage: e.toString()));
    }
    return null;
  }

  Future<bool> deletePost(int id) async {
    try {
      // emit(PostLoaded(post: post))
      notesRepository.deletePost(id);
      _deletedPostId = id;
      fetchPost();
      log('DELETED POST SUCCESSFUL');
      return true;
    } catch (e) {
      return false;
    }
  }
}
