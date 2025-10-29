import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/contexts/books_context.dart';
import 'package:nim2book_mobile_flutter/core/env/env.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/services/book_service.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class BookScreen extends StatefulWidget {
  final String bookId;

  const BookScreen({super.key, required this.bookId});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final _apiBaseUrl = GetIt.I.get<Env>().apiBaseUrl;
  final bookService = GetIt.I.get<BookService>();
  Book? book;
  bool isLoading = true;

  void _loadBook() async {
    final fetchedBook = await bookService.getBook(widget.bookId);
    setState(() {
      book = fetchedBook;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadBook();
  }

  @override
  Widget build(BuildContext context) {
    final booksContext = context.watch<BooksContext>();
    final l10n = AppLocalizations.of(context)!;

    final book = this.book;
    final isLoading = this.isLoading;

    if (isLoading) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (book == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(l10n.bookNotFound)),
      );
    }

    final isMyBook = booksContext.myBooks.any((b) => b.id == book.id);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          spacing: 30,
          children: [
            if (book.cover != null)
              Image.network(
                '$_apiBaseUrl/api/v1/file/public?path=${Uri.encodeComponent(book.cover!)}',
                height: 300,
                width: 200,
                fit: BoxFit.cover,
              )
            else
              Image.asset(
                'assets/placeholder_book_cover.jpg',
                height: 300,
                width: 200,
                fit: BoxFit.cover,
              ),

            Text(
              book.title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            Text(
              '${l10n.author}: ${book.author}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),

            if (!isMyBook)
              ElevatedButton.icon(
                onPressed: () => booksContext.addMyBook(book),
                icon: const Icon(Icons.add),
                label: Text(l10n.addToMyBooks),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  FilledButton.icon(
                    onPressed: () => context.push('/reading/${book.id}'),
                    icon: const Icon(Icons.menu_book),
                    label: Text(l10n.readBook),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => booksContext.removeMyBook(book),
                    icon: const Icon(Icons.delete_outline),
                    label: Text(l10n.delete),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
