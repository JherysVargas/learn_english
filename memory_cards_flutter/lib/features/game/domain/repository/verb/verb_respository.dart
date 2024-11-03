import 'package:memory_cards_flutter/features/game/domain/models/verb/verb_model.dart';

abstract class VerbRepository {
  Future<List<VerbModel>?> getVerbs();
}
