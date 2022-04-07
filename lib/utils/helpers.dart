import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pavlok/config/constants.dart';

class Helpers {
  static void showSnackBar(String message,
      {SnackbarType type = SnackbarType.log}) {
    Color _color;
    switch (type) {
      case SnackbarType.error:
        _color = Colors.red.shade800;
        break;
      case SnackbarType.success:
        _color = Colors.green.shade800;
        break;
      case SnackbarType.log:
        _color = Colors.grey.shade900;
        break;
    }

    Constants.scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        backgroundColor: _color,
        dismissDirection: DismissDirection.endToStart,
        behavior: SnackBarBehavior.floating,
        elevation: 2,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  static void tap(VoidCallback? action) {
    HapticFeedback.selectionClick();
    action?.call();
  }
}

class Format {
  // static const String _currency = '₦';
  static const String _currency = 'N';

  static String toCurrency(num amount) {
    final number = amount.round().toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );

    return '$_currency$number';
  }
}

enum SnackbarType { error, success, log }
