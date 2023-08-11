import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/data/model/post_model.dart';
import 'package:test_app/data/repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final Repository repository;

  PostCubit({required this.repository})
      : super(const PostInitial(initialMessage: 'No posts'));

  Future<List<PostModel>?> fetchPost() async {
    try {
      // emit(PostLoading());
      emit(const PostInitial());
      emit(PostLoading());
      repository.fetchPost().then((posts) {
        // posts != null
        if (posts != null) {
          emit(PostLoaded(post: posts));
        } else {
          emit(const PostError(errorMessage: 'Error while loading posts'));
        }
      });
    } catch (e) {
      log('TryCatch000');
      log('PostCubit fetch catch: ${e.toString()}');
      emit(const PostError(
          errorMessage: "can't fetch post line 19 post_cubit.dart"));
    }
    return null;
  }

  Future<String?> deletePost(PostModel post) async {
    try {
      emit(PostLoading());
      // emit(PostLoaded(post: post))
      log('DELETED POST SUCCESSFUL');
      repository.fetchPost().then((posts) {
        if (posts != null) {
          emit(PostLoaded(post: posts));
        }
      });
    } catch (e) {
      return 'error deleting the post';
    }
    return null;
  }
}
