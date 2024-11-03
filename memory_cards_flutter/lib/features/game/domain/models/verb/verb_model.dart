import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:memory_cards_flutter/core/enums/status_match_verb.dart';
import 'package:memory_cards_flutter/core/helpers/document_reference_convert.dart';

part 'verb_model.g.dart';

@JsonSerializable()
class VerbModel extends Equatable {
  const VerbModel({
    this.statusMatchVerb = StatusMatchVerb.none,
    this.isBaseVerb = true,
    this.reference,
    this.id = 0,
    this.baseVerb = '',
    this.pastTense = '',
    this.translation = '',
    this.pastParticiple = '',
    this.present = '',
    this.gerund = '',
    this.examples = const [],
    this.categories = const [],
  });

  final int id;
  final String baseVerb;
  final String pastTense;
  final String translation;
  final String pastParticiple;
  final String present;
  final String gerund;
  final List<String> examples;

  @JsonKey(includeToJson: false)
  final StatusMatchVerb statusMatchVerb;

  @JsonKey(includeToJson: false)
  final bool isBaseVerb;

  @DocumentReferenceConverter()
  final DocumentReference? reference;

  @ListDocumentReferenceConverter()
  final List<DocumentReference>? categories;

  VerbModel copyWith({
    int? id,
    bool? isBaseVerb,
    String? title,
    String? description,
    String? baseVerb,
    String? pastTense,
    String? translation,
    String? pastParticiple,
    String? present,
    String? gerund,
    List<String>? examples,
    DocumentReference? reference,
    StatusMatchVerb? statusMatchVerb,
    List<DocumentReference>? categories,
  }) =>
      VerbModel(
        id: id ?? this.id,
        isBaseVerb: isBaseVerb ?? this.isBaseVerb,
        baseVerb: baseVerb ?? this.baseVerb,
        pastTense: pastTense ?? this.pastTense,
        translation: translation ?? this.translation,
        pastParticiple: pastParticiple ?? this.pastParticiple,
        present: present ?? this.present,
        gerund: gerund ?? this.gerund,
        examples: examples ?? this.examples,
        categories: categories ?? this.categories,
        reference: reference ?? this.reference,
        statusMatchVerb: statusMatchVerb ?? this.statusMatchVerb,
      );

  factory VerbModel.fromRawJson(String str) =>
      VerbModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerbModel.fromJson(Map<String, dynamic> json) =>
      _$VerbModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerbModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        baseVerb,
        pastTense,
        translation,
        pastParticiple,
        present,
        gerund,
        examples,
        reference,
        categories,
        statusMatchVerb,
        isBaseVerb,
      ];
}
