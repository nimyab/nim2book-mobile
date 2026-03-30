import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/providers/book/books_provider.dart';
import 'package:nim2book_mobile_flutter/core/router/app_routes.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/screens/my_books_screen/widgets/books_section.dart';

import 'package:nim2book_mobile_flutter/core/providers/auth/auth_provider.dart';

class MyBooksScreen extends ConsumerWidget {
  const MyBooksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<String?>(
      booksNotifierProvider.select((s) => s.errorMessage),
      (previous, next) {
        if (next != null && next != previous) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next)),
          );
        }
      },
    );

    final isAuthenticated = ref.watch(isAuthenticatedProvider);
    final l10n = AppLocalizations.of(context)!;

    final savedBooks = ref.watch(savedBooksProvider);
    final personalBooks = ref.watch(personalBooksProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.myBooks)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BooksSection(
                title: l10n.personalBooks,
                personalBooks: personalBooks,
                onAddTap: () {
                  if (!isAuthenticated) {
                    context.push(AppRoutes.login);
                    return;
                  }

                  final isVIP = ref.read(isVIPProvider);
                  if (!isVIP) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.vipRequired)),
                    );
                    return;
                  }

                  context.push(AppRoutes.addBook, extra: {'isPublic': false});
                },
              ),
              BooksSection(
                title: l10n.sharedBooks,
                books: savedBooks,
                onAddTap: () => context.go(AppRoutes.books),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
