import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/bloc/loading_book_cubit.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/book_reading.dart';

class ReadingScreen extends StatefulWidget {
  final String bookId;

  const ReadingScreen({super.key, required this.bookId});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  Widget build(final BuildContext context) {
    return BlocProvider<LoadingBookCubit>(
      create: (final context) =>
          LoadingBookCubit(bookId: widget.bookId)..getBookData(),
      child: const BookReading(),
    );
  }
}
