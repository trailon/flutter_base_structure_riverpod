import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/blueprints/base_viewmodel.dart';
import '../../app/router/router.gr.dart';

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModalProvider, HomeViewModel>(
  (_) => HomeViewModalProvider(HomeViewModel()),
);

class HomeViewModalProvider extends StateNotifier<HomeViewModel> {
  HomeViewModalProvider(HomeViewModel state) : super(state);

  setResponse(HomeViewModel response) => state = response;
}

class HomeViewModel extends BaseViewModel {
  @override
  void disposeModel() {}

  @override
  Future<void> getData() async {
    await Future.delayed(const Duration(seconds: 2));
    debugPrint('Delayed 2 seconds');
  }

  void pushToDetailView() async {
    await super.appRouter.push(const DetailViewRoute());

    /* await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DetailView(),
        )); */
  }
}
