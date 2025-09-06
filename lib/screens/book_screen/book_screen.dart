import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  final String bookId;

  const BookScreen({super.key, required this.bookId});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
