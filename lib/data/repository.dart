import 'package:test_app/data/model/post_model.dart';
import 'package:test_app/data/network_service.dart';

class Repository {
  final NetworkService networkService;

  Repository({required this.networkService});

  Future<List<PostModel>> fetchPost() async {
    final post = await networkService.fetchPost();
    return post.map((e) => PostModel.fromJson(e)).toList();
  }

  Future<List<PostModel>> deletePost(PostModel selectedPost) async {
    final post = await networkService.deletePost(selectedPost.id.toString());

    if (post.contains(selectedPost)) {
      selectedPost.copyWith(deleted: true);
    }
    return post.map((e) => PostModel.fromJson(e)).toList();
  }
}
