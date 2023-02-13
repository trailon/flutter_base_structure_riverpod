import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/blueprints/base_viewmodel.dart';

final detailViewModelProvider =
    StateNotifierProvider<DetailViewModalProvider, DetailViewModel>(
  (_) => DetailViewModalProvider(DetailViewModel()),
);

class DetailViewModalProvider extends StateNotifier<DetailViewModel> {
  DetailViewModalProvider(DetailViewModel state) : super(state);

  setResponse(DetailViewModel response) => state = response;
}

class DetailViewModel extends BaseViewModel {
  @override
  void disposeModel() {}

  @override
  Future<void> getData() async {}
}
