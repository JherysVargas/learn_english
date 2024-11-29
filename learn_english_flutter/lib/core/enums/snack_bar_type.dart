import 'package:flutter/material.dart';
import 'package:learn_english_flutter/shared/domain/models/snackbar_type/snackbar_type.dart';

enum SnackBarType {
  success(
    SnackBarTypeModel(
      label: 'Éxito',
      color: Colors.green,
      icon: Icons.check_circle,
    ),
  ),
  error(
    SnackBarTypeModel(
      label: 'Error',
      icon: Icons.error,
      color: Colors.red,
    ),
  );

  const SnackBarType(this.type);
  final SnackBarTypeModel type;
}
