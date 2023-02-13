import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/blueprints/base_page_view.dart';
import 'home_viewmodel.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.watch(homeViewModelProvider);
    return BasePageView<HomeViewModel>(
      viewModel: homeViewModel,
      content: _ViewContent(viewModal: homeViewModel),
    );
  }
}

class _ViewContent extends StatelessWidget {
  const _ViewContent({Key? key, required this.viewModal}) : super(key: key);
  final HomeViewModel viewModal;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Home View'),
          TextButton(
              onPressed: () async => viewModal.pushToDetailView(),
              child: const Text('Go to Detail View'))
        ],
      ),
    );
  }
}
