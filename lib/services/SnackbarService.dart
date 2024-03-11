import 'package:events_all/values/app_constant.dart';
import 'package:flutter/material.dart';

class SnackbarService {
  const SnackbarService._();

  static final GlobalKey<ScaffoldMessengerState> _key =
      GlobalKey<ScaffoldMessengerState>();

  static GlobalKey<ScaffoldMessengerState> get key => _key;

  static ScaffoldMessengerState? showSnack(
    String message, {
    TextStyle? textStyle,
  }) {
    return _key.currentState
      ?..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(20),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(AppConstant.roundedBorder8),
          ),
          content: Text(message, style: textStyle),
        ),
      );
  }
}
