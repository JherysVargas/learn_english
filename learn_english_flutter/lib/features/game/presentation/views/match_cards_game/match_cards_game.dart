import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_english_flutter/features/game/presentation/cubit/game/game_cubit.dart';
import 'package:learn_english_flutter/features/game/presentation/views/match_cards_game/widgets/molecules/header.dart';

import 'widgets/molecules/board.dart';

class MatchCardsGame extends StatelessWidget {
  const MatchCardsGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetIt.instance.get<GameCubit>()..getVerbs(),
        child: const SafeArea(
          child: Column(
            children: [
              Expanded(
                child: HeaderMatchCards(),
              ),
              Expanded(
                flex: 3,
                child: Board(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
