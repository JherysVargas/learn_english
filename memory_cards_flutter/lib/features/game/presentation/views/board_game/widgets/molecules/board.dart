import 'package:flutter/material.dart';

import '../atoms/card.dart';

class Board extends StatelessWidget {
  final int quantityItems;

  const Board({super.key, required this.quantityItems});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const int columns = 3;
        const double axisSpacing = 4;
        const double horizontalPadding = 20;
        const double verticalPadding = 16;

        final double maxHeight = constraints.maxHeight;
        final int rows = (quantityItems / columns).ceil();

        const double totalVerticalPadding = verticalPadding * 2;
        final double totalAxisSpacing = axisSpacing * rows;

        final double mainAxisExtent =
            (maxHeight - (totalVerticalPadding + totalAxisSpacing)) / rows;

        return GridView.builder(
          itemCount: quantityItems,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: mainAxisExtent,
            crossAxisCount: columns,
            mainAxisSpacing: axisSpacing,
            crossAxisSpacing: axisSpacing,
          ),
          itemBuilder: (BuildContext _, int __) {
            return const CustomFlipCard();
          },
        );
      },
    );
  }
}
