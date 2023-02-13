import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/blueprints/base_page_view.dart';
import 'detail_viewmodel.dart';

class DetailView extends ConsumerWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailViewModel = ref.watch(detailViewModelProvider);
    return BasePageView<DetailViewModel>(
      appBar: AppBar(
        title: const Text('Detail View'),
      ),
      viewModel: detailViewModel,
      content: const _ViewContent(),
    );
  }
}

class _ViewContent extends StatelessWidget {
  const _ViewContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Detail View'),
    );
  }
}
