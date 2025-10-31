import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class MainScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffold({super.key, required this.navigationShell});

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(children: [Expanded(child: navigationShell)]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.my_library_books),
            label: l10n.myBooks,
          ),
          NavigationDestination(icon: Icon(Icons.book), label: l10n.books),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            label: l10n.learning,
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: l10n.settings,
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
