import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../widgets/item.dart';
import '../widgets/trash.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<ItemModel> _items = [
    ItemModel(name: 'Jornal', image: 'jornal.png', type: TrashType.papel),
    ItemModel(name: 'Garrafa PET', image: 'pet.png', type: TrashType.plastico),
    ItemModel(name: 'Copo de vidro', image: 'vidro.png', type: TrashType.vidro),
    ItemModel(name: 'Banana', image: 'banana.png', type: TrashType.organico),
  ];

  int _score = 0;

  void _handleItemDropped(ItemModel item) {
    setState(() {
      _items.remove(item);
      _score += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recicla Rápido!'),
        actions: [Padding(padding: const EdgeInsets.all(16.0), child: Text('Pontos: $_score'))],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            children: _items.map((item) => DraggableItem(item: item)).toList(),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TrashBin(
                type: TrashType.papel,
                color: Colors.blue,
                label: 'Papel',
                onAccept: _handleItemDropped,
              ),
              TrashBin(
                type: TrashType.plastico,
                color: Colors.red,
                label: 'Plástico',
                onAccept: _handleItemDropped,
              ),
              TrashBin(
                type: TrashType.vidro,
                color: Colors.green,
                label: 'Vidro',
                onAccept: _handleItemDropped,
              ),
              TrashBin(
                type: TrashType.organico,
                color: Colors.brown,
                label: 'Orgânico',
                onAccept: _handleItemDropped,
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
