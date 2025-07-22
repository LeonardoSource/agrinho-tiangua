enum TrashType { papel, plastico, vidro, organico }

class ItemModel {
  final String name;
  final String image;
  final TrashType type;

  ItemModel({required this.name, required this.image, required this.type});
}
