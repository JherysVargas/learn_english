import 'package:injectable/injectable.dart';
import 'package:learn_english_flutter/features/game/data/data_sources/remote/verb/abstract_verb_data_source.dart';
import 'package:learn_english_flutter/features/game/domain/models/verb/verb_model.dart';
import 'package:learn_english_flutter/features/game/domain/repository/verb/verb_respository.dart';

@Injectable(as: VerbRepository)
class VerbRepositoryImpl implements VerbRepository {
  final VerbRemoteDataSource _verbRemoteDataSource;

  VerbRepositoryImpl(this._verbRemoteDataSource);

  @override
  Future<List<VerbModel>?> getVerbs() async {
    try {
      final result = await _verbRemoteDataSource.getVerbs();

      return result;
    } catch (e) {
      return [];
    }
  }
}
