import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/providers/book/books_provider.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/screens/my_books_screen/widgets/books_section.dart';

class MyBooksScreen extends ConsumerWidget {
  const MyBooksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedBooks = ref.watch(savedBooksProvider);
    final personalBooks = ref.watch(personalBooksProvider);
    final l10n = AppLocalizations.of(context)!;

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
                onAddTap: () => context.push('/add-book'),
              ),
              BooksSection(
                title: l10n.sharedBooks,
                books: savedBooks,
                onAddTap: () => context.go('/books'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
