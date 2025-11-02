import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class MainScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffold({super.key, required this.navigationShell});

  void _goBranch(final int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(children: [Expanded(child: navigationShell)]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.my_library_books),
            label: l10n.myBooks,
          ),
          NavigationDestination(
            icon: const Icon(Icons.book),
            label: l10n.books,
          ),
          NavigationDestination(
            icon: const Icon(Icons.school_outlined),
            label: l10n.learning,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings),
            label: l10n.settings,
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
