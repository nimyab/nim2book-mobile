import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/env/env.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';

class BookCard extends StatelessWidget {
  final _apiBaseUrl = GetIt.I.get<Env>().apiBaseUrl;
  final Book book;
  final Function()? onTap;

  BookCard({super.key, required this.book, this.onTap});

  @override
  Widget build(BuildContext context) {
    final coverUrl = book.cover != null
        ? '$_apiBaseUrl/api/v1/file/public?path=${Uri.encodeComponent(book.cover!)}'
        : null;
    return GestureDetector(
      onTap: () async {
        if (coverUrl != null) {
          // Предзагрузка изображения для плавной анимации Hero
          await precacheImage(CachedNetworkImageProvider(coverUrl), context);
        }
        onTap?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (coverUrl != null)
              Hero(
                tag: 'book-cover-${book.id}',
                child: Image(
                  image: CachedNetworkImageProvider(coverUrl),
                  height: 120,
                  width: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/placeholder_book_cover.jpg',
                    height: 120,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Image.asset(
                'assets/placeholder_book_cover.jpg',
                height: 120,
                width: 80,
                fit: BoxFit.cover,
              ),

            const SizedBox(width: 10),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  spacing: 5,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                    Text(book.author, style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
