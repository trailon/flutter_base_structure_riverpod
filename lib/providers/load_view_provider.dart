import 'package:flutter_riverpod/flutter_riverpod.dart';

final loadViewProvider = StateProvider<bool>(
  (_) => false,
);

class LoadViewProvider extends StateNotifier<bool> { // if needed
  LoadViewProvider(bool state) : super(state);

  setLoadView(bool loadView) => state = loadView;
}
