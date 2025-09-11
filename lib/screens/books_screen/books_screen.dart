import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/contexts/books_context.dart';
import 'package:provider/provider.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Books Screen')),
      body: Consumer<BooksContext>(
        builder: (context, value, child) {
          final books = value.allBooks;

          return Center(
            child: books.isEmpty
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: books.length,
                          itemBuilder: (context, index) {
                            final book = books[index];
                            return ListTile(
                              title: Text(book.title),
                              subtitle: Text(book.author),
                              onTap: () {
                                context.push('/reading/${book.id}');
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
