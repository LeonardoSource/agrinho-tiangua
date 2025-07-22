import 'package:flutter/material.dart';
import '../models/item_model.dart';

class DraggableItem extends StatelessWidget {
  final ItemModel item;

  const DraggableItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Draggable<ItemModel>(
      data: item,
      feedback: Image.asset(item.image, height: 60),
      childWhenDragging: Opacity(opacity: 0.4, child: Image.asset(item.image, height: 60)),
      child: Image.asset(item.image, height: 60),
    );
  }
}
