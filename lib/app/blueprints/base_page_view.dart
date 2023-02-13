import 'package:flutter/material.dart';
import '../../providers/load_view_provider.dart';
import '../../providers/response_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/basic_error_widget.dart';
import '../../widgets/box_container.dart';
import '../../widgets/circle_card_widget.dart';
import '../../widgets/custom_circular_progress_indicator.dart';
import '../../widgets/custom_transition_switcher.dart';
import 'base_viewmodel.dart';

class BasePageView<T extends BaseViewModel> extends ConsumerWidget {
  final Widget? floatingActionButton;
  final AppBar? appBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? content;
  final bool haveScaffold;
  final bool showCircleCard;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool fabRequiresStatus;
  final bool endDrawerEnableOpenDragGesture;
  final bool shouldWaitForGetData;
  final T viewModel;

  const BasePageView({
    Key? key,
    this.appBar,
    this.floatingActionButton,
    this.drawer,
    this.endDrawer,
    this.content,
    this.haveScaffold = true,
    this.showCircleCard = true,
    this.scaffoldKey,
    this.fabRequiresStatus = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.shouldWaitForGetData = true,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responseStatus = ref.read(responseProvider);
    return haveScaffold
        ? Scaffold(
            key: scaffoldKey,
            floatingActionButton: !fabRequiresStatus
                ? floatingActionButton
                : responseStatus.status != null && responseStatus.status!
                    ? floatingActionButton
                    : null,
            appBar: appBar,
            drawer: drawer,
            endDrawer: endDrawer,
            endDrawerEnableOpenDragGesture: fabRequiresStatus
                ? (responseStatus.status ?? false) &&
                    endDrawerEnableOpenDragGesture
                : endDrawerEnableOpenDragGesture,
            body: _PageLoadingWidget<T>(
              viewModel: viewModel,
              content: content,
              showCircleCard: showCircleCard,
            ),
          )
        : _PageLoadingWidget<T>(
            viewModel: viewModel,
            content: content,
            showCircleCard: showCircleCard,
            shouldWaitForGetData: shouldWaitForGetData,
          );
  }
}

class _PageLoadingWidget<T extends BaseViewModel>
    extends ConsumerStatefulWidget {
  final T viewModel;
  final Widget? content;
  final bool? showCircleCard;
  final bool shouldWaitForGetData;
  const _PageLoadingWidget(
      {Key? key,
      required this.content,
      required this.viewModel,
      this.showCircleCard,
      this.shouldWaitForGetData = true});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __PageLoadingWidgetState<T>();
/*   @override
  __PageLoadingWidgetState<T> createState() => __PageLoadingWidgetState<T>(); */
}

class __PageLoadingWidgetState<T extends BaseViewModel>
    extends ConsumerState<_PageLoadingWidget> {
  get _provider => widget.viewModel;

  @override
  void initState() {
    super.initState();
    _provider.getData().then((value) {
      ref.read(loadViewProvider.notifier).update((state) => true);
    });
  }

  @override
  void dispose() {
    _provider.disposeModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewDidLoad = ref.watch(loadViewProvider);
    final responseStatus = ref.read(responseProvider);
    return widget.shouldWaitForGetData
        ? CustomTransitionSwitcher(
            child: !viewDidLoad
                ? const BoxContainer(child: CustomCircularProgressIndicator())
                : responseStatus.status == null || responseStatus.status!
                    ? _CircleLoadingWidget<T>(
                        viewModel: _provider,
                        content: widget.content,
                        showCircleCard: widget.showCircleCard,
                      )
                    : BasicErrorWidget(error: responseStatus.errorMessage),
          )
        : _CircleLoadingWidget<T>(
            viewModel: _provider,
            content: widget.content,
            showCircleCard: widget.showCircleCard,
          );
  }
}

class _CircleLoadingWidget<T extends BaseViewModel> extends StatelessWidget {
  final Widget? content;
  final bool? showCircleCard;
  final T viewModel;
  const _CircleLoadingWidget(
      {Key? key,
      required this.content,
      this.showCircleCard,
      required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!showCircleCard!) {
      return content!;
    }
    if (viewModel.loading) {
      return CircleCardWidget(
        showCard: viewModel.loading,
        child: content,
      );
    }
    return content!;
  }
}
