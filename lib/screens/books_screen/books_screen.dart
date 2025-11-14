import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/bloc/auth/auth_cubit.dart';
import 'package:nim2book_mobile_flutter/core/router/router.dart';
import 'package:nim2book_mobile_flutter/features/books/bloc/books_cubit.dart';
import 'package:nim2book_mobile_flutter/features/books/widgets/book_card.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() => setState(() {}));
  }

  void _onQueryChanged(final String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      final q = value.trim();
      if (q.isEmpty) {
        context.read<BooksCubit>().getBooks(null, null, 1);
      } else {
        context.read<BooksCubit>().searchBooks(q);
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isAuthenticated = context.select(
      (final AuthCubit c) => c.state.isAuthenticated,
    );
    final isVIP = context.select((final AuthCubit c) => c.state.isVIP);

    final booksState = context.watch<BooksCubit>().state;
    final books = booksState.allBooks;
    final isFetching = booksState.isFetching;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.books)),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onQueryChanged,
                    decoration: InputDecoration(
                      hintText: l10n.search,
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _searchController.text.isEmpty
                          ? null
                          : IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                                _onQueryChanged('');
                              },
                            ),
                    ),
                  ),
                ),
                Expanded(
                  child: isFetching
                      ? const Center(child: CircularProgressIndicator())
                      : books.isEmpty
                      ? Center(child: Text(l10n.noBooksFound))
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ListView.separated(
                            separatorBuilder: (final context, final index) =>
                                const SizedBox(height: 15),
                            itemCount: books.length,
                            itemBuilder: (final context, final index) {
                              final book = books[index];
                              final tag = 'book-cover-${book.id}-books';
                              return BookCard(
                                key: ValueKey(book.id),
                                book: book,
                                heroTag: tag,
                                onTap: () => context.push(
                                  '/book/${book.id}',
                                  extra: BookRouteExtra(
                                    heroTag: tag,
                                    book: book,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ),
              ],
            ),
            if (isAuthenticated)
              Positioned(
                right: 16,
                bottom: 16,
                child: Tooltip(
                  message: l10n.add,
                  child: ElevatedButton(
                    onPressed: isVIP
                        ? () => context.push('/add-book')
                        : () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(l10n.addingBooksVipOnly)),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.surfaceContainer,
                      foregroundColor: theme.colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: null,
    );
  }
}
