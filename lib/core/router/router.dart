import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/models/learning/learning_mode.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/screens/add_book_screen/add_book_screen.dart';
import 'package:nim2book_mobile_flutter/screens/book_screen/book_screen.dart';
import 'package:nim2book_mobile_flutter/screens/books_screen/books_screen.dart';
import 'package:nim2book_mobile_flutter/screens/dictionary_screen/dictionary_screen.dart';
import 'package:nim2book_mobile_flutter/screens/learning_screen/learning_screen.dart';
import 'package:nim2book_mobile_flutter/screens/learning_session_screen/learning_session_screen.dart';
import 'package:nim2book_mobile_flutter/screens/login_screen/login_screen.dart';
import 'package:nim2book_mobile_flutter/screens/my_books_screen/my_books_screen.dart';
import 'package:nim2book_mobile_flutter/screens/reading_screen/reading_screen.dart';
import 'package:nim2book_mobile_flutter/screens/register_screen/register_screen.dart';
import 'package:nim2book_mobile_flutter/screens/settings_screen/settings_screen.dart';
import 'package:nim2book_mobile_flutter/widgets/main_scaffold.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:nim2book_mobile_flutter/core/router/app_routes.dart';

class BookRouteExtra {
  final String? heroTag;
  final Book? book;

  const BookRouteExtra({this.heroTag, this.book});
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

// Provider для роутера
final routerProvider = Provider<GoRouter>((ref) {
  ref.keepAlive();
  final talker = ref.watch(talkerProvider);

  return GoRouter(
    initialLocation: AppRoutes.myBooks,
    navigatorKey: _rootNavigatorKey,
    observers: [TalkerRouteObserver(talker)],
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (final context, final state) => const LoginScreen(),
      ),

      GoRoute(
        path: AppRoutes.register,
        name: 'register',
        builder: (final context, final state) => const RegisterScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (final context, final state, final navigationShell) {
          return MainScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.myBooks,
                name: 'my-books',
                builder: (final context, final state) => const MyBooksScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.books,
                name: 'books',
                builder: (final context, final state) => const BooksScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.learning,
                name: 'learning-shell',
                builder: (final context, final state) => const LearningScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.settings,
                name: 'settings',
                builder: (final context, final state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: AppRoutes.learningSession,
        name: 'learning-session',
        redirect: (_, __) => '${AppRoutes.learningSession}/${AppRoutes.learningSessionMixed}',
        routes: [
          GoRoute(
            path: AppRoutes.learningSessionNew,
            name: 'learning-session-new',
            builder: (final context, final state) =>
                const LearningSessionScreen(mode: LearningMode.newOnly),
          ),
          GoRoute(
            path: AppRoutes.learningSessionReview,
            name: 'learning-session-review',
            builder: (final context, final state) =>
                const LearningSessionScreen(mode: LearningMode.reviewOnly),
          ),
          GoRoute(
            path: AppRoutes.learningSessionMixed,
            name: 'learning-session-mixed',
            builder: (final context, final state) =>
                const LearningSessionScreen(mode: LearningMode.mixed),
          ),
        ],
      ),

      GoRoute(
        path: AppRoutes.book,
        name: 'book',
        builder: (final context, final state) {
          final bookId = state.pathParameters['bookId']!;
          String? heroTag;
          Book? initialBook;
          final extra = state.extra;
          if (extra is String) {
            heroTag = extra;
          } else if (extra is BookRouteExtra) {
            heroTag = extra.heroTag;
            initialBook = extra.book;
          } else if (extra is Map) {
            heroTag = extra['heroTag'] as String?;
            initialBook = extra['book'] as Book?;
          }
          return BookScreen(
            bookId: bookId,
            heroTag: heroTag,
            initialBook: initialBook,
          );
        },
      ),

      GoRoute(
        path: AppRoutes.reading,
        name: 'reading',
        builder: (final context, final state) {
          final bookId = state.pathParameters['bookId']!;
          return ReadingScreen(bookId: bookId);
        },
      ),

      GoRoute(
        path: AppRoutes.addBook,
        name: 'add-book',
        builder: (final context, final state) {
          final extra = state.extra as Map<String, dynamic>?;
          final isPublic = extra?['isPublic'] as bool? ?? false;
          return AddBookScreen(isPublic: isPublic);
        },
      ),

      GoRoute(
        path: AppRoutes.dictionary,
        name: 'dictionary',
        builder: (final context, final state) => const DictionaryScreen(),
      ),
    ],
  );
});

