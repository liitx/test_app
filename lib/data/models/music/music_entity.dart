class MusicEntity {
  final int? userId;
  final int id;
  final String? title;
  final String? body;

  MusicEntity({
    this.userId,
    required this.id,
    this.title,
    this.body,
  });

  factory MusicEntity.fromJson(Map<String, dynamic> json) => MusicEntity(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );
}
