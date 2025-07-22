import 'package:flutter/material.dart';
import '../models/item_model.dart';

class TrashBin extends StatelessWidget {
  final TrashType type;
  final Color color;
  final String label;
  final void Function(ItemModel) onAccept;

  const TrashBin({
    super.key,
    required this.type,
    required this.color,
    required this.label,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<ItemModel>(
      onWillAccept: (data) => data!.type == type,
      onAccept: onAccept,
      builder: (context, candidateData, rejectedData) => Container(
        width: 80,
        height: 100,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
