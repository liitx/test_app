class ViewPostModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  final bool? isFavorite;
  final bool? isDelete;

  ViewPostModel(
      {this.userId,
      this.id,
      this.title,
      this.body,
      this.isFavorite,
      this.isDelete});

  ViewPostModel copyWith({
    bool? isFavorite,
    bool? isDelete,
  }) =>
      ViewPostModel(isFavorite: isFavorite ?? this.isFavorite, isDelete: isDelete ?? this.isDelete);
}
