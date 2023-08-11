class PostModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  final bool? favorited;
  final bool? deleted;

  PostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.favorited = false,
    this.deleted = false,
  });

  PostModel copyWith({bool? favorited, bool? deleted}) => PostModel(
        favorited: favorited ?? this.favorited,
        deleted: deleted ?? this.deleted,
      );

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );
}
