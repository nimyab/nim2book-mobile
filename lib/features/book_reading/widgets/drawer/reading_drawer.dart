import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/bloc/loading_book/loading_book_cubit.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/bloc/reading_settings/reading_settings_cubit.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/drawer/chapter_list_tab.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/drawer/drawer_header_actions.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/drawer/search_sheet.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/drawer/text_settings_tab.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class ReadingDrawer extends StatelessWidget {
  const ReadingDrawer({super.key});

  void _openSearchSheet(final BuildContext context) {
    final loadingState = context.read<LoadingBookCubit>().state;
    final chapters = loadingState.chapters;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => SearchSheet(chapters: chapters),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final loadingState = context.watch<LoadingBookCubit>().state;
    final isFullscreen = context.select(
      (final ReadingSettingsCubit c) => c.state.isFullscreen,
    );
    final chapters = loadingState.chapters;

    return Drawer(
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              DrawerHeaderActions(
                isFullscreen: isFullscreen,
                onClose: () {
                  Navigator.of(context).maybePop();
                },
                onToggleFullscreen: () async {
                  final newValue = !isFullscreen;
                  context.read<ReadingSettingsCubit>().setFullscreen(
                    value: newValue,
                  );
                  if (newValue) {
                    await SystemChrome.setEnabledSystemUIMode(
                      SystemUiMode.immersiveSticky,
                    );
                  } else {
                    await SystemChrome.setEnabledSystemUIMode(
                      SystemUiMode.edgeToEdge,
                    );
                  }
                },
                onOpenSearch: () {
                  _openSearchSheet(context);
                },
              ),
              Material(
                color: Theme.of(context).colorScheme.surface,
                child: TabBar(
                  tabs: [
                    Tab(icon: const Icon(Icons.menu_book), text: l10n.chapter),
                    Tab(icon: const Icon(Icons.tune), text: l10n.settings),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ChapterListTab(chapters: chapters),
                    const TextSettingsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
