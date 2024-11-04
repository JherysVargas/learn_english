import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_english_flutter/core/enums/status_match_verb.dart';
import 'package:learn_english_flutter/features/game/domain/models/verb/verb_model.dart';
import 'package:learn_english_flutter/features/game/domain/usecases/verb/verb_usecases.dart';

part 'game_state.dart';

@injectable
class GameCubit extends Cubit<GameState> {
  final VerbUsecases _verbUsecases;

  GameCubit(this._verbUsecases) : super(GameInitial());

  Future<void> getVerbs() async {
    emit(GameLoading());
    final result = await _verbUsecases.getVerbs();
    if (result != null) {
      emit(GameLoaded(verbs: result));
    } else {
      emit(GameError());
    }
  }

  void selectedVerb(VerbModel verb) {
    final GameLoaded currentState = state as GameLoaded;
    final Map<int, VerbModel> correctMatches = {...currentState.correctMatches};

    if (correctMatches.containsKey(verb.id)) {
      correctMatches.update(
        verb.id,
        (value) => verb.copyWith(statusMatchVerb: StatusMatchVerb.match),
      );
    } else {
      final VerbModel? lastVerb = correctMatches.values.lastOrNull;

      if (correctMatches.isEmpty ||
          lastVerb?.statusMatchVerb == StatusMatchVerb.match) {
        correctMatches.putIfAbsent(
          verb.id,
          () => verb.copyWith(statusMatchVerb: StatusMatchVerb.pending),
        );
      } else if (lastVerb?.statusMatchVerb == StatusMatchVerb.pending) {
        correctMatches.remove(lastVerb?.id);
      }
    }

    emit(
      currentState.copyWith(
        correctMatches: correctMatches,
      ),
    );
  }
}
