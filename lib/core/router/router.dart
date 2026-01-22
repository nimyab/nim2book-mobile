import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/bloc/auth/auth_cubit.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
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

class BookRouteExtra {
  final String? heroTag;
  final Book? book;

  const BookRouteExtra({this.heroTag, this.book});
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class GoRouterRefreshNotifier extends ChangeNotifier {
  GoRouterRefreshNotifier(final AuthCubit authCubit) {
    authCubit.stream.listen((_) {
      notifyListeners();
    });
  }
}

GoRouter createRouter(final AuthCubit authCubit) {
  return GoRouter(
    initialLocation: '/my-books',
    navigatorKey: _rootNavigatorKey,
    observers: [TalkerRouteObserver(GetIt.I.get<Talker>())],
    refreshListenable: GoRouterRefreshNotifier(authCubit),
    redirect: (context, state) {
      final isAuthenticated = authCubit.state.isAuthenticated;
      final isLoading = authCubit.state.isLoading;
      final currentPath = state.uri.path;
      final isLoginRoute = currentPath == '/login';
      final isRegisterRoute = currentPath == '/register';

      // Пока идет загрузка, не делаем редирект
      if (isLoading) {
        return null;
      }

      // Если пользователь авторизован и находится на экране логина/регистрации
      if (isAuthenticated && (isLoginRoute || isRegisterRoute)) {
        return '/my-books';
      }

      // Если пользователь не авторизован и пытается попасть на защищенные страницы
      if (!isAuthenticated && !isLoginRoute && !isRegisterRoute) {
        return '/login';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (final context, final state) => const LoginScreen(),
      ),

      GoRoute(
        path: '/register',
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
                path: '/my-books',
                name: 'my-books',
                builder: (final context, final state) => const MyBooksScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/books',
                name: 'books',
                builder: (final context, final state) => const BooksScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/learning',
                name: 'learning-shell',
                builder: (final context, final state) => const LearningScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                name: 'settings',
                builder: (final context, final state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: '/learning-session',
        name: 'learning-session',
        redirect: (_, _) => '/learning-session/mixed',
        routes: [
          GoRoute(
            path: '/new',
            name: 'learning-session-new',
            builder: (final context, final state) =>
                const LearningSessionScreen(mode: LearningMode.newOnly),
          ),
          GoRoute(
            path: '/review',
            name: 'learning-session-review',
            builder: (final context, final state) =>
                const LearningSessionScreen(mode: LearningMode.reviewOnly),
          ),
          GoRoute(
            path: '/mixed',
            name: 'learning-session-mixed',
            builder: (final context, final state) =>
                const LearningSessionScreen(mode: LearningMode.mixed),
          ),
        ],
      ),

      GoRoute(
        path: '/book/:bookId',
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
        path: '/reading/:bookId',
        name: 'reading',
        builder: (final context, final state) {
          final bookId = state.pathParameters['bookId']!;
          return ReadingScreen(bookId: bookId);
        },
      ),

      GoRoute(
        path: '/add-book',
        name: 'add-book',
        builder: (final context, final state) => AddBookScreen(
          initialBook: state.extra is Book ? state.extra as Book : null,
        ),
      ),

      GoRoute(
        path: '/dictionary',
        name: 'dictionary',
        builder: (final context, final state) => const DictionaryScreen(),
      ),
    ],
  );
}
