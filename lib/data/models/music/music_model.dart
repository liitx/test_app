class MusicModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  final bool? isFavorite;
  final bool? isDelete;

  MusicModel(
      {this.userId,
      this.id,
      this.title,
      this.body,
      this.isFavorite,
      this.isDelete});

  MusicModel copyWith({
    bool? isFavorite,
    bool? isDelete,
  }) =>
      MusicModel(
          isFavorite: isFavorite ?? this.isFavorite,
          isDelete: isDelete ?? this.isDelete);
}
