import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/router/router.dart';
import 'package:nim2book_mobile_flutter/features/books/bloc/books_cubit.dart';
import 'package:nim2book_mobile_flutter/features/books/widgets/book_card.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class MyBooksScreen extends StatefulWidget {
  const MyBooksScreen({super.key});

  @override
  State<MyBooksScreen> createState() => _MyBooksScreenState();
}

class _MyBooksScreenState extends State<MyBooksScreen> {
  @override
  Widget build(final BuildContext context) {
    final booksState = context.watch<BooksCubit>().state;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.myBooks)),
      body: booksState.myBooks.isEmpty
          ? Center(child: Text(l10n.noBooksFound))
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView.separated(
                itemCount: booksState.myBooks.length,
                separatorBuilder: (final context, final index) =>
                    const SizedBox(height: 15),
                itemBuilder: (final context, final index) {
                  final book = booksState.myBooks[index];
                  final tag = 'book-cover-${book.id}-my-books';
                  return BookCard(
                    key: ValueKey(book.id),
                    book: book,
                    heroTag: tag,
                    onTap: () => context.push(
                      '/book/${book.id}',
                      extra: BookRouteExtra(heroTag: tag, book: book),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
