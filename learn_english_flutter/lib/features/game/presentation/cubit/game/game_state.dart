part of 'game_cubit.dart';

sealed class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

final class GameInitial extends GameState {}

final class GameLoading extends GameState {}

final class GameLoaded extends GameState {
  final List<VerbModel> verbs;
  final Map<int, VerbModel> correctMatches;

  const GameLoaded({
    required this.verbs,
    this.correctMatches = const {},
  });

  GameLoaded copyWith({
    List<VerbModel>? verbs,
    Map<int, VerbModel>? correctMatches,
  }) {
    return GameLoaded(
      verbs: verbs ?? this.verbs,
      correctMatches: correctMatches ?? this.correctMatches,
    );
  }

  @override
  List<Object> get props => [verbs, correctMatches];
}

final class GameError extends GameState {}

final class GameFinished extends GameState {
  final int quantityMatches;

  const GameFinished({required this.quantityMatches});

  @override
  List<Object> get props => [quantityMatches];
}

final class GameReset extends GameState {}
