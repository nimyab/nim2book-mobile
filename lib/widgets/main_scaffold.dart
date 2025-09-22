import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.my_library_books),
            label: 'Мои книги',
          ),
          NavigationDestination(icon: Icon(Icons.book), label: 'Книги'),
          NavigationDestination(icon: Icon(Icons.translate), label: 'Словарь'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Настройки'),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
