import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/models/personal_user_book/personal_user_book.dart';
import 'package:nim2book_mobile_flutter/core/router/router.dart';
import 'package:nim2book_mobile_flutter/screens/my_books_screen/widgets/add_book_card.dart';
import 'package:nim2book_mobile_flutter/screens/my_books_screen/widgets/vertical_book_card.dart';

class BooksSection extends StatelessWidget {
  final String title;
  final List<Book>? books;
  final List<PersonalUserBook>? personalBooks;
  final VoidCallback onAddTap;

  const BooksSection({
    required this.title,
    required this.onAddTap,
    this.books,
    this.personalBooks,
    super.key,
  }) : assert(
         books != null || personalBooks != null,
         'Either books or personalBooks must be provided',
       );

  @override
  Widget build(BuildContext context) {
    final totalItems = (books?.length ?? personalBooks?.length ?? 0) + 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: totalItems,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              if (index == 0) {
                return AddBookCard(onTap: onAddTap);
              }

              if (books != null) {
                return _buildBookCard(context, books![index - 1]);
              } else {
                return _buildPersonalBookCard(
                  context,
                  personalBooks![index - 1],
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBookCard(BuildContext context, Book book) {
    final tag = 'book-cover-${book.id}-my-books';
    return SizedBox(
      width: 160,
      child: VerticalBookCard(
        key: ValueKey(book.id),
        book: book,
        heroTag: tag,
        onTap: () => context.push(
          '/book/${book.id}',
          extra: BookRouteExtra(heroTag: tag, book: book),
        ),
      ),
    );
  }

  Widget _buildPersonalBookCard(
    BuildContext context,
    PersonalUserBook personalBook,
  ) {
    final tag = 'personal-book-cover-${personalBook.id}-my-books';

    // Convert PersonalUserBook to Book for BookCard
    final bookForCard = Book(
      id: personalBook.id,
      title: personalBook.title,
      author: personalBook.author,
      chapterPaths: personalBook.chapterPaths,
      cover: personalBook.cover,
      genres: personalBook.genres,
    );

    return SizedBox(
      width: 160,
      child: VerticalBookCard(
        key: ValueKey(personalBook.id),
        book: bookForCard,
        heroTag: tag,
        onTap: () => context.push(
          '/book/${personalBook.id}',
          extra: BookRouteExtra(heroTag: tag, book: bookForCard),
        ),
      ),
    );
  }
}
