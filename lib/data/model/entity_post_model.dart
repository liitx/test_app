class EntityPostModel {
  final int? userId;
  final int id;
  final String? title;
  final String? body;

  EntityPostModel({
    this.userId,
    required this.id,
    this.title,
    this.body,
  });

  factory EntityPostModel.fromJson(Map<String, dynamic> json) => EntityPostModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );
}
