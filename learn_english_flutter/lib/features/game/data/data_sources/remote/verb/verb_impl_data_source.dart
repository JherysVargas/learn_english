import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:learn_english_flutter/features/game/domain/models/verb/verb_model.dart';

import 'abstract_verb_data_source.dart';

@Injectable(as: VerbRemoteDataSource)
class ActorRemoteDataSourceImpl implements VerbRemoteDataSource {
  final Logger _logger;
  final FirebaseFirestore _firestore;

  static const String _collectionName = 'verbs';

  ActorRemoteDataSourceImpl(this._logger, this._firestore);

  @override
  Future<List<VerbModel>?> getVerbs() async {
    try {
      return _firestore.collection(_collectionName).get().then(
        (value) {
          return value.docs
              .map((e) =>
                  VerbModel.fromJson({'reference': e.reference, ...e.data()}))
              .toList();
        },
      );
    } on FirebaseException catch (e) {
      _logger.e('Error getting verbs: ${e.message}');
      rethrow;
    }
  }
}
