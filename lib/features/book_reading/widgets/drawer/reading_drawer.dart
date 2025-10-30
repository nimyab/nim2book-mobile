import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/book_reading_context.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/drawer/chapter_list_tab.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/drawer/drawer_header_actions.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/drawer/search_sheet.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/drawer/text_settings_tab.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/screens/reading_screen/loading_book_context.dart';
import 'package:provider/provider.dart';

class ReadingDrawer extends StatelessWidget {
  const ReadingDrawer({super.key});

  void _openSearchSheet(BuildContext context) {
    final loadingBookContext = context.read<LoadingBookContext>();
    final chapters = loadingBookContext.chapters;
    final readingContext = context.read<BookReadingContext>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) =>
          SearchSheet(chapters: chapters, readingContext: readingContext),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final loadingBookContext = context.watch<LoadingBookContext>();
    final readingContext = context.watch<BookReadingContext>();
    final chapters = loadingBookContext.chapters;

    return Drawer(
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              DrawerHeaderActions(
                isFullscreen: readingContext.isFullscreen,
                onClose: () {
                  Navigator.of(context).maybePop();
                },
                onToggleFullscreen: () async {
                  readingContext.isFullscreen = !readingContext.isFullscreen;
                  if (readingContext.isFullscreen) {
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
                    TextSettingsTab(),
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
