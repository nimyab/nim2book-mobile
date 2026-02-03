import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';

class BookCard extends ConsumerWidget {
  final Book book;
  final VoidCallback? onTap;
  final String? heroTag;

  const BookCard({super.key, required this.book, this.onTap, this.heroTag});

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final apiBaseUrl = ref.read(envProvider).apiBaseUrl;
    final coverUrl = book.cover != null
        ? '$apiBaseUrl/api/v1/file/public?path=${Uri.encodeComponent(book.cover!)}'
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
                tag: heroTag ?? 'book-cover-${book.id}',
                child: Image(
                  image: CachedNetworkImageProvider(coverUrl),
                  height: 120,
                  width: 80,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (final context, final error, final stackTrace) =>
                          Image.asset(
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
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                    Text(book.author, style: const TextStyle(fontSize: 16)),
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
