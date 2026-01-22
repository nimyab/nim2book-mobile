import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/bloc/books/books_cubit.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/screens/my_books_screen/widgets/books_section.dart';

class MyBooksScreen extends StatelessWidget {
  const MyBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booksState = context.watch<BooksCubit>().state;
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
                personalBooks: booksState.personalBooks,
                onAddTap: () => context.push('/add-book'),
              ),
              BooksSection(
                title: l10n.sharedBooks,
                books: booksState.myBooks,
                onAddTap: () => context.go('/books'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
