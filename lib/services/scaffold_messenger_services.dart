import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../app/app_config.dart';
import '../app/app_defaults.dart';

@lazySingleton
class ScaffoldMessengerService {
  final _context = AppConfig.context;
  final _currnetScaffoldState = AppConfig.rootScaffoldMessengerKey.currentState;

  void showSnackbarWithText(String text,
      {bool emptyQueue = true,
      Color? snackbarColor,
      TextAlign? textAlign,
      double? textScaleFactor}) {
    final snackbar = SnackBar(
      backgroundColor: Theme.of(_context)
          .snackBarTheme
          .copyWith(backgroundColor: snackbarColor)
          .backgroundColor,
      behavior: Theme.of(_context).snackBarTheme.behavior,
      content: Text(
        text,
        textAlign: textAlign,
        textScaleFactor: textScaleFactor,
      ),
      width: AppDefaults.kStandartSnackbarWidth,
    );

    if (emptyQueue) {
      _currnetScaffoldState?.clearSnackBars();
    }

    _currnetScaffoldState?.showSnackBar(snackbar);
  }
}

class SnackBarColor {
  static const Color success = Colors.green;
}
