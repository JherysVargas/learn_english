import 'package:injectable/injectable.dart';
import 'package:learn_english_flutter/features/game/domain/models/verb/verb_model.dart';
import 'package:learn_english_flutter/features/game/domain/repository/verb/verb_respository.dart';

@injectable
class VerbUsecases {
  final VerbRepository _verbRepository;

  VerbUsecases(this._verbRepository);

  Future<List<VerbModel>?> getVerbs() => _verbRepository.getVerbs();
}
