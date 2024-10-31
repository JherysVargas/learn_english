import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'verb_model.g.dart';

@JsonSerializable()
class VerbModel {
  const VerbModel({
    this.id = 0,
    this.baseVerb = '',
    this.pastTense = '',
    this.translation = '',
  });

  final int id;
  final String baseVerb;
  final String pastTense;
  final String translation;

  VerbModel copyWith({
    int? id,
    String? title,
    String? description,
    String? baseVerb,
    String? pastTense,
    String? translation,
  }) =>
      VerbModel(
        id: id ?? this.id,
        baseVerb: baseVerb ?? this.baseVerb,
        pastTense: pastTense ?? this.pastTense,
        translation: translation ?? this.translation,
      );

  factory VerbModel.fromRawJson(String str) =>
      VerbModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerbModel.fromJson(Map<String, dynamic> json) =>
      _$VerbModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerbModelToJson(this);
}
