import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/screens/add_book_screen/add_book_screen.dart';
import 'package:nim2book_mobile_flutter/screens/book_screen/book_screen.dart';
import 'package:nim2book_mobile_flutter/screens/books_screen/books_screen.dart';
import 'package:nim2book_mobile_flutter/screens/dictionary_screen/dictionary_screen.dart';
import 'package:nim2book_mobile_flutter/screens/learning_screen/learning_screen.dart';
import 'package:nim2book_mobile_flutter/screens/login_screen/login_screen.dart';
import 'package:nim2book_mobile_flutter/screens/my_books_screen/my_books_screen.dart';
import 'package:nim2book_mobile_flutter/screens/reading_screen/reading_screen.dart';
import 'package:nim2book_mobile_flutter/screens/register_screen/register_screen.dart';
import 'package:nim2book_mobile_flutter/screens/settings_screen/settings_screen.dart';
import 'package:nim2book_mobile_flutter/screens/stats_screen/stats_screen.dart';
import 'package:nim2book_mobile_flutter/widgets/main_scaffold.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/my-books',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScaffold(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/my-books',
              name: 'my-books',
              builder: (context, state) => const MyBooksScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/books',
              name: 'books',
              builder: (context, state) => const BooksScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/dictionary',
              name: 'dictionary',
              builder: (context, state) => const DictionaryScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              name: 'settings',
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: '/book/:bookId',
      name: 'book',
      builder: (context, state) {
        final bookId = state.pathParameters['bookId']!;
        return BookScreen(bookId: bookId);
      },
    ),

    GoRoute(
      path: '/reading/:bookId',
      name: 'reading',
      builder: (context, state) {
        final bookId = state.pathParameters['bookId']!;
        return ReadingScreen(bookId: bookId);
      },
    ),

    GoRoute(
      path: '/add-book',
      name: 'add-book',
      builder: (context, state) => const AddBookScreen(),
    ),

    GoRoute(
      path: '/learning',
      name: 'learning',
      builder: (context, state) => const LearningScreen(),
    ),

    GoRoute(
      path: '/stats',
      name: 'stats',
      builder: (context, state) => const StatsScreen(),
    ),
  ],
);
