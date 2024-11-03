import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_cards_flutter/core/enums/status_match_verb.dart';
import 'package:memory_cards_flutter/core/extensions/capitalize_extension.dart';
import 'package:memory_cards_flutter/features/game/domain/models/verb/verb_model.dart';
import 'package:memory_cards_flutter/features/game/presentation/cubit/game/game_cubit.dart';

class CustomFlipCard extends StatefulWidget {
  final VerbModel verb;

  const CustomFlipCard({super.key, required this.verb});

  @override
  State<CustomFlipCard> createState() => _CustomFlipCardState();
}

class _CustomFlipCardState extends State<CustomFlipCard> {
  late final FlipCardController _controllerFlip = FlipCardController();

  Color _getColor(StatusMatchVerb status) {
    return switch (status) {
      StatusMatchVerb.match => Theme.of(context).colorScheme.primary,
      StatusMatchVerb.pending => Theme.of(context).colorScheme.tertiary,
      _ => Theme.of(context).colorScheme.tertiary
    };
  }

  _handleSelectedVerb(bool isFront) async {
    if (!isFront) {
      context.read<GameCubit>().selectedVerb(widget.verb);
    }
  }

  _handleToggleCardNoMatch(GameLoaded state) {
    final bool existingMatch = state.correctMatches.containsKey(
      widget.verb.id,
    );
    if (!existingMatch && _controllerFlip.state!.isFront) {
      _controllerFlip.toggleCard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameState>(
      listenWhen: (previous, current) {
        return current is GameLoaded &&
            previous is GameLoaded &&
            previous.correctMatches != current.correctMatches;
      },
      listener: (_, state) => _handleToggleCardNoMatch(state as GameLoaded),
      builder: (_, state) {
        final Map<int, VerbModel> correctMatches =
            (state as GameLoaded).correctMatches;

        final bool isMatch = correctMatches[widget.verb.id]?.statusMatchVerb ==
            StatusMatchVerb.match;

        return FlipCard(
          flipOnTouch: !isMatch,
          onFlipDone: _handleSelectedVerb,
          controller: _controllerFlip,
          direction: FlipDirection.HORIZONTAL,
          side: CardSide.BACK,
          front: _buildFront(correctMatches),
          back: _buildBack(),
        );
      },
    );
  }

  Widget _buildFront(Map<int, VerbModel> state) {
    final text = widget.verb.isBaseVerb
        ? widget.verb.pastParticiple
        : widget.verb.baseVerb;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: _getColor(
          state[widget.verb.id]?.statusMatchVerb ?? StatusMatchVerb.none,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          text.capitalize(),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.black87,
              ),
        ),
      ),
    );
  }

  Widget _buildBack() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Icon(Icons.question_mark_sharp),
      ),
    );
  }
}
