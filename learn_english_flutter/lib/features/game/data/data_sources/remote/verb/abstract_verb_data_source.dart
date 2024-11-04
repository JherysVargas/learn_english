import 'package:learn_english_flutter/features/game/domain/models/verb/verb_model.dart';

abstract class VerbRemoteDataSource {
  Future<List<VerbModel>?> getVerbs();
}
