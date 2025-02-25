import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(
          milliseconds: 500,
        ),
      ),
    );
  }

  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;

  void removeFocus() => FocusScope.of(this).unfocus();

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  double get bottomPadding => MediaQuery.of(this).viewInsets.bottom;
}
