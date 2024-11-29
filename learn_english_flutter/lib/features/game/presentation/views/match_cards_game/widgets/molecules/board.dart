import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_english_flutter/core/enums/status_match_verb.dart';
import 'package:learn_english_flutter/features/game/domain/models/verb/verb_model.dart';
import 'package:learn_english_flutter/features/game/presentation/cubit/game/game_cubit.dart';
import 'package:learn_english_flutter/features/game/presentation/views/match_cards_game/widgets/atoms/grid_board.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  List<int> _generateRandomIndexes(int quantityGenerate, int quantity) {
    return List.generate(
      quantityGenerate,
      (index) => Random().nextInt(quantity),
    ).toList();
  }

  List<VerbModel> _getRandomData(List<VerbModel> verbs) {
    final List<VerbModel> data = [];
    final List<int> indexes = _generateRandomIndexes(12, verbs.length);

    for (var index in indexes) {
      final verb = verbs[index];

      data.addAll([
        verb.copyWith(isBaseVerb: true),
        verb.copyWith(isBaseVerb: false),
      ]);
    }

    data.shuffle();

    return data;
  }

  bool _filterVerbs(VerbModel verb) {
    return verb.statusMatchVerb == StatusMatchVerb.match;
  }

  // void _handleShowSnackBar(
  //   BuildContext context,
  //   Iterable<VerbModel> correctMatches,
  // ) {
  //   final lastMatch = correctMatches.last;

  //   SnackBarFloating.show(
  //     message: lastMatch.translation.capitalize(),
  //     context: context,
  //     duration: const Duration(seconds: 6),
  //     behavior: SnackBarBehavior.fixed,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameState>(
      listenWhen: (previous, current) {
        return current is GameLoaded &&
            previous is GameLoaded &&
            previous.correctMatches.values.where(_filterVerbs).length !=
                current.correctMatches.values.where(_filterVerbs).length;
      },
      listener: (ctx, state) {
        // final correctMatches = (state as GameLoaded).correctMatches;
        // _handleShowSnackBar(ctx, correctMatches.values);
      },
      builder: (_, GameState state) {
        return switch (state) {
          GameLoaded() => _buildGridBoard(state.verbs),
          _ => _buildLoading(),
        };
      },
    );
  }

  Widget _buildGridBoard(List<VerbModel> verbs) {
    final data = _getRandomData(verbs);

    return GridBoard(
      verbs: data,
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
