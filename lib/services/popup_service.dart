import 'package:dialog_service/dialog_service.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../app/app_config.dart';
import '../app/app_defaults.dart';
import '../app/locator/locator.dart';
import '../app/strings/asset_strings.dart';

@lazySingleton
class PopupService {
  @protected
  final _dialogService = locator<DialogService>();
  final BuildContext _context = AppConfig.context;

  Future<void> showSuccess() async {
    _dialogService.showAnimatedPullBottomSheet(
      _context,
      minHeightApp: AppDefaults.bottomSheetAnimationHeigt,
      child: const _PopUpWidget(
          animation: "Untitled", animationPath: AssetStrings.successCheckFlr),
    );

    await _animationWaiter();
  }

  Future<void> showFailed() async {
    _dialogService.showAnimatedPullBottomSheet(_context,
        minHeightApp: AppDefaults.bottomSheetAnimationHeigt,
        child: const _PopUpWidget(
            animation: "failed", animationPath: AssetStrings.failedFlr));

    await _animationWaiter();
  }

  Future<void> showWarning() async {
    _dialogService.showAnimatedPullBottomSheet(_context,
        minHeightApp: AppDefaults.bottomSheetAnimationHeigt,
        child: const _PopUpWidget(
            animation: "play", animationPath: AssetStrings.warningFlr));
    await _animationWaiter();
  }

  Future<void> _animationWaiter() async {
    await Future.delayed(const Duration(milliseconds: 1700))
        .whenComplete(() => _dialogService.dismissOverlay());
  }
}

class _PopUpWidget extends StatelessWidget {
  const _PopUpWidget({
    Key? key,
    required this.animation,
    required this.animationPath,
  }) : super(key: key);
  final String animation;
  final String animationPath;
  final double _maxHeight = 400;
  final double _maxWidth = 500;
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: _maxWidth,
      maxHeight: _maxHeight,
      child: FlareActor(
        animationPath,
        alignment: Alignment.center,
        fit: BoxFit.fitWidth,
        animation: animation,
        isPaused: false,
      ),
    );
  }
}
