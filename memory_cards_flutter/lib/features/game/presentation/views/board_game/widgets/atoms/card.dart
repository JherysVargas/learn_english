import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CustomFlipCard extends StatelessWidget {
  const CustomFlipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      side: CardSide.BACK,
      front: _buildFront(context),
      back: _buildBack(context),
    );
  }

  Widget _buildFront(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text('Card'),
      ),
    );
  }

  Widget _buildBack(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text('Card'),
      ),
    );
  }
}
