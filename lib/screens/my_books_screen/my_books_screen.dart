import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/features/books/contexts/books_context.dart';
import 'package:nim2book_mobile_flutter/features/books/widgets/book_card.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class MyBooksScreen extends StatefulWidget {
  const MyBooksScreen({super.key});

  @override
  State<MyBooksScreen> createState() => _MyBooksScreenState();
}

class _MyBooksScreenState extends State<MyBooksScreen> {
  @override
  Widget build(BuildContext context) {
    final booksContext = context.watch<BooksContext>();
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.myBooks)),
      body: booksContext.myBooks.isEmpty
          ? Center(child: Text(l10n.noBooksFound))
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView.separated(
                itemCount: booksContext.myBooks.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemBuilder: (context, index) {
                  final book = booksContext.myBooks[index];
                  return BookCard(
                    key: ValueKey(book.id),
                    book: book,
                    onTap: () => context.push('/book/${book.id}'),
                  );
                },
              ),
            ),
    );
  }
}
