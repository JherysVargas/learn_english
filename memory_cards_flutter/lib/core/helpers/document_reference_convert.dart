import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class DocumentReferenceConverter
    implements JsonConverter<DocumentReference?, DocumentReference?> {
  const DocumentReferenceConverter();

  @override
  DocumentReference<Object?>? fromJson(DocumentReference<Object?>? document) {
    return document;
  }

  @override
  DocumentReference<Object?>? toJson(DocumentReference<Object?>? document) {
    return document;
  }
}

class ListDocumentReferenceConverter
    implements JsonConverter<List<DocumentReference>?, List<dynamic>?> {
  const ListDocumentReferenceConverter();

  @override
  List<DocumentReference> fromJson(List<dynamic>? list) {
    return list?.map((e) => e as DocumentReference).toList() ?? [];
  }

  @override
  List<dynamic> toJson(List<DocumentReference>? list) {
    return list?.map((e) => e).toList() ?? [];
  }
}
