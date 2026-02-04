import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/reading_settings/reading_settings_provider.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/drawer/chapter_list_tab.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/drawer/drawer_header_actions.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/drawer/search_sheet.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/drawer/text_settings_tab.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class ReadingDrawer extends ConsumerWidget {
  final String bookId;
  final List<ChapterAlignNode> chapters;

  const ReadingDrawer({
    super.key,
    required this.bookId,
    required this.chapters,
  });

  void _openSearchSheet(final BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => SearchSheet(bookId: bookId, chapters: chapters),
    );
  }

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isFullscreen = ref.watch(
      readingSettingsNotifierProvider.select((state) => state.isFullscreen),
    );

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
                  ref
                      .read(readingSettingsNotifierProvider.notifier)
                      .setFullscreen(value: newValue);
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
                    ChapterListTab(bookId: bookId, chapters: chapters),
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
