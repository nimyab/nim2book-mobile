import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/book_reading.dart';
import 'package:nim2book_mobile_flutter/screens/reading_screen/loading_book_context.dart';
import 'package:nim2book_mobile_flutter/screens/reading_screen/reading_context.dart';
import 'package:provider/provider.dart';

class ReadingScreen extends StatefulWidget {
  final String bookId;

  const ReadingScreen({super.key, required this.bookId});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoadingBookContext(bookId: widget.bookId),
        ),
        ChangeNotifierProxyProvider<LoadingBookContext, ReadingContext>(
          create: (context) => ReadingContext(
            bookId: widget.bookId,
            chapters: [],
          ),
          update: (context, value, previous) {
            return ReadingContext(
              bookId: widget.bookId,
              chapters: value.chapters,
            );
          },
        ),
      ],
      builder: (context, child) {
        return const BookReading();
      },
    );
  }
}
