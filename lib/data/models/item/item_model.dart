class ItemModel {
  final int? itemId;
  final String? q;

  ItemModel({
    this.itemId,
    this.q,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        itemId: json["itemId"],
        q: json["q"],
      );
}
