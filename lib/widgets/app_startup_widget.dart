import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';

class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({super.key, required this.onLoaded});
  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appStartupProvider);
    return onLoaded(context);
  }
}
