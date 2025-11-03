import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/env/env.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/services/book_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nim2book_mobile_flutter/features/books/bloc/books_cubit.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class BookScreen extends StatefulWidget {
  final String bookId;
  final String? heroTag;
  final Book? initialBook;

  const BookScreen({
    super.key,
    required this.bookId,
    this.heroTag,
    this.initialBook,
  });

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
    final initial = widget.initialBook;
    if (initial != null) {
      book = initial;
      isLoading = false;
    } else {
      _loadBook();
    }
  }

  @override
  Widget build(final BuildContext context) {
    final booksState = context.watch<BooksCubit>().state;
    final l10n = AppLocalizations.of(context)!;

    final currentBook = book;
    final isLoading = this.isLoading;
    final isMyBook = currentBook != null
        ? booksState.myBooks.any((final b) => b.id == currentBook.id)
        : false;

    final coverUrl = currentBook?.cover != null
        ? '$_apiBaseUrl/api/v1/file/public?path=${Uri.encodeComponent(currentBook!.cover!)}'
        : null;

    final Widget coverHero = Hero(
      tag: widget.heroTag ?? 'book-cover-${widget.bookId}',
      flightShuttleBuilder:
          (
            final flightContext,
            final animation,
            final flightDirection,
            final fromHeroContext,
            final toHeroContext,
          ) {
            final fromHero = fromHeroContext.widget as Hero;
            return Material(
              type: MaterialType.transparency,
              child: fromHero.child,
            );
          },
      child: (coverUrl != null)
          ? Image(
              image: CachedNetworkImageProvider(coverUrl),
              height: 300,
              width: 200,
              fit: BoxFit.cover,
            )
          : Image.asset(
              'assets/placeholder_book_cover.jpg',
              height: 300,
              width: 200,
              fit: BoxFit.cover,
            ),
    );

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          spacing: 30,
          children: [
            coverHero,
            if (isLoading)
              const CircularProgressIndicator()
            else if (currentBook == null)
              Text(l10n.bookNotFound)
            else ...[
              Text(
                currentBook.title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '${l10n.author}: ${currentBook.author}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              if (!isMyBook)
                ElevatedButton.icon(
                  onPressed: () =>
                      context.read<BooksCubit>().addMyBook(currentBook),
                  icon: const Icon(Icons.add),
                  label: Text(l10n.addToMyBooks),
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16,
                  children: [
                    FilledButton.icon(
                      onPressed: () =>
                          context.push('/reading/${currentBook.id}'),
                      icon: const Icon(Icons.menu_book),
                      label: Text(l10n.readBook),
                    ),
                    OutlinedButton.icon(
                      onPressed: () =>
                          context.read<BooksCubit>().removeMyBook(currentBook),
                      icon: const Icon(Icons.delete_outline),
                      label: Text(l10n.delete),
                    ),
                  ],
                ),
            ],
          ],
        ),
      ),
    );
  }
}
