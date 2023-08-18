class ItemEntity {
  final int? itemId;
  final String? q;

  ItemEntity({
    this.itemId,
    this.q,
  });

  factory ItemEntity.fromJson(Map<String, dynamic> json) => ItemEntity(
        itemId: json["itemId"],
        q: json["q"],
      );
}
