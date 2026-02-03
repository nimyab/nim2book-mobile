import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/book_reading.dart';

class ReadingScreen extends ConsumerWidget {
  final String bookId;

  const ReadingScreen({super.key, required this.bookId});

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    return BookReading(bookId: bookId);
  }
}
