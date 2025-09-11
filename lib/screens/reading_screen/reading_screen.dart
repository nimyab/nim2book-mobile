import 'package:flutter/material.dart';

class ReadingScreen extends StatefulWidget {
  final String bookId;

  const ReadingScreen({super.key, required this.bookId});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reading Book')),
    );
  }
}
