part of 'post_cubit.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

final class PostInitial extends PostState {
  final String? initialMessage;

  const PostInitial({this.initialMessage});

  @override
  List<Object?> get props => [initialMessage];
}

final class PostLoading extends PostState {
  @override
  List<Object> get props => [];
}

final class PostLoaded extends PostState {
  final List<PostModel> post;
  const PostLoaded({required this.post});
  @override
  List<Object> get props => [post];
}

final class PostError extends PostState {
  final String errorMessage;
  const PostError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
