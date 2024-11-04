import 'package:flutter/material.dart';
import 'package:learn_english_flutter/features/game/domain/models/verb/verb_model.dart';

import '../atoms/card.dart';

class Board extends StatelessWidget {
  final List<VerbModel> verbs;

  const Board({super.key, required this.verbs});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final int quantity = verbs.length;
        final int columns = quantity > 12 ? 4 : 3;
        const double axisSpacing = 4;
        const double horizontalPadding = 20;
        const double verticalPadding = 16;

        final double maxHeight = constraints.maxHeight;
        final int rows = (quantity / columns).ceil();

        const double totalVerticalPadding = verticalPadding * 2;
        final double totalAxisSpacing = axisSpacing * rows;

        final double mainAxisExtent =
            (maxHeight - (totalVerticalPadding + totalAxisSpacing)) / rows;

        return GridView.builder(
          itemCount: quantity,
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
          itemBuilder: (BuildContext _, int index) {
            return CustomFlipCard(
              verb: verbs[index],
            );
          },
        );
      },
    );
  }
}
