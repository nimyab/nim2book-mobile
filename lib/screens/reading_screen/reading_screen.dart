import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/book_reading.dart';
import 'package:nim2book_mobile_flutter/screens/reading_screen/loading_book_context.dart';
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
    return ChangeNotifierProvider(
      create: (context) => LoadingBookContext(bookId: widget.bookId),
      builder: (context, child) {
        return const BookReading();
      },
    );
  }
}
