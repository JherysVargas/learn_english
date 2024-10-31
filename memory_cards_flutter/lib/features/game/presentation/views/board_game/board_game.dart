import 'package:flutter/material.dart';

import 'widgets/molecules/board.dart';

class BoardGame extends StatelessWidget {
  const BoardGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory Cards'),
      ),
      body: const Column(
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Text('Memory Cards'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Board(quantityItems: 12),
          ),
        ],
      ),
    );
  }
}
