import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/env/env.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';

class VerticalBookCard extends StatelessWidget {
  final _apiBaseUrl = GetIt.I.get<Env>().apiBaseUrl;
  final Book book;
  final VoidCallback? onTap;
  final String? heroTag;

  VerticalBookCard({super.key, required this.book, this.onTap, this.heroTag});

  @override
  Widget build(BuildContext context) {
    final coverUrl = book.cover != null
        ? '$_apiBaseUrl/api/v1/file/public?path=${Uri.encodeComponent(book.cover!)}'
        : null;

    return GestureDetector(
      onTap: () async {
        if (coverUrl != null) {
          await precacheImage(CachedNetworkImageProvider(coverUrl), context);
        }
        onTap?.call();
      },
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: coverUrl != null
                  ? Hero(
                      tag: heroTag ?? 'book-cover-${book.id}',
                      child: CachedNetworkImage(
                        imageUrl: coverUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/placeholder_book_cover.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Image.asset(
                      'assets/placeholder_book_cover.jpg',
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    book.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    book.author,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
