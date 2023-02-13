import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/locator/locator.dart';
import 'destech_template_app.dart';

void main() {
  setupLocator();
  runApp(const AppWrapper());
}

class AppWrapper extends ConsumerStatefulWidget {
  const AppWrapper({Key? key}) : super(key: key);

  @override
  ConsumerState<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends ConsumerState<AppWrapper> {
  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: DestechTemplateApp(),
    );
  }
}
