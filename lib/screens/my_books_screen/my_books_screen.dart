import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/contexts/books_context.dart';
import 'package:nim2book_mobile_flutter/widgets/book_card.dart';
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

    return Scaffold(
      appBar: AppBar(title: const Text('My Books')),
      body: booksContext.myBooks.isEmpty
          ? const Center(child: Text('No books found'))
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
                    onTap: () => context.push('/reading/${book.id}'),
                  );
                },
              ),
            ),
    );
  }
}
