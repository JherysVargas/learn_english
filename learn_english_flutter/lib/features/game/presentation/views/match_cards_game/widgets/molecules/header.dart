import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_english_flutter/core/enums/status_match_verb.dart';
import 'package:learn_english_flutter/features/game/presentation/cubit/game/game_cubit.dart';
import 'package:learn_english_flutter/shared/ui/widgets/molecules/timer_progress_indicator.dart';

class HeaderMatchCards extends StatelessWidget {
  const HeaderMatchCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Matches Verbs',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: 8),
                _buildTextScore(),
              ],
            ),
          ),
          const SizedBox(width: 20),
          const SizedBox(
            width: 70,
            height: 70,
            child: TimerProgressIndicator(
              maxTimeInSecond: 60,
              isAutoStart: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextScore() {
    return BlocSelector<GameCubit, GameState, int>(
      selector: (state) {
        if (state is GameLoaded && state.correctMatches.isNotEmpty) {
          return state.correctMatches.values
              .where(
                  (element) => element.statusMatchVerb == StatusMatchVerb.match)
              .length;
        }

        return 0;
      },
      builder: (context, quantityMatches) {
        return Text(
          'Score: $quantityMatches',
          style: Theme.of(context).textTheme.headlineSmall,
        );
      },
    );
  }
}
