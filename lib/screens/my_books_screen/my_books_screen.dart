import 'package:flutter/material.dart';
import 'dart:async';
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
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() => setState(() {}));
  }

  void _onQueryChanged(final String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () {
      setState(() {
        _query = value.trim();
      });
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
    final booksState = context.watch<BooksCubit>().state;
    final l10n = AppLocalizations.of(context)!;

    final filtered = _query.isEmpty
        ? booksState.myBooks
        : booksState.myBooks.where((final b) {
            final q = _query.toLowerCase();
            return b.title.toLowerCase().contains(q) ||
                b.author.toLowerCase().contains(q);
          }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.myBooks)),
      body: SafeArea(
        child: Column(
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
              child: filtered.isEmpty
                  ? Center(child: Text(l10n.noBooksFound))
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListView.separated(
                        itemCount: filtered.length,
                        separatorBuilder: (final context, final index) =>
                            const SizedBox(height: 15),
                        itemBuilder: (final context, final index) {
                          final book = filtered[index];
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
            ),
          ],
        ),
      ),
    );
  }
}
