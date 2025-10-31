import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/contexts/auth_context.dart';
import 'package:nim2book_mobile_flutter/core/contexts/books_context.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/widgets/book_card.dart';
import 'package:provider/provider.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final authContext = context.watch<AuthContext>();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.books)),
      body: Consumer<BooksContext>(
        builder: (context, value, child) {
          final books = value.allBooks;
          final isFetching = value.isFetchingBooks;

          return isFetching
              ? const Center(child: CircularProgressIndicator())
              : books.isEmpty
              ? Center(child: Text(l10n.noBooksFound))
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return BookCard(
                        key: ValueKey(book.id),
                        book: book,
                        onTap: () => context.push('/book/${book.id}'),
                      );
                    },
                  ),
                );
        },
      ),
      floatingActionButton: authContext.isAuthenticated
          ? FloatingActionButton(
              onPressed: authContext.isVIP
                  ? () => context.push('/add-book')
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l10n.addingBooksVipOnly)),
                      );
                    },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [Icon(Icons.add), Icon(Icons.book)],
              ),
            )
          : null,
    );
  }
}
