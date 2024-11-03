import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:memory_cards_flutter/features/game/domain/models/verb/verb_model.dart';
import 'package:memory_cards_flutter/features/game/presentation/cubit/game/game_cubit.dart';

import 'widgets/molecules/board.dart';

class BoardGame extends StatelessWidget {
  const BoardGame({super.key});

  List<int> _generateRandomIndexes(int quantityGenerate, int quantity) {
    return List.generate(
      quantityGenerate,
      (index) => Random().nextInt(quantity),
    ).toList();
  }

  List<VerbModel> _getRandomData(List<VerbModel> verbs) {
    final List<VerbModel> data = [];
    final List<int> indexes = _generateRandomIndexes(6, verbs.length);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory Cards'),
      ),
      body: BlocProvider(
        create: (context) => GetIt.instance.get<GameCubit>()..getVerbs(),
        child: Column(
          children: [
            const Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Text('Memory Cards'),
              ),
            ),
            Expanded(
              flex: 3,
              child: BlocSelector<GameCubit, GameState, List<VerbModel>>(
                selector: (state) {
                  if (state is GameLoaded && state.verbs.isNotEmpty) {
                    return state.verbs;
                  }
                  return [];
                },
                builder: (_, verbs) {
                  if (verbs.isNotEmpty) {
                    final data = _getRandomData(verbs);

                    return Board(
                      verbs: data,
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
