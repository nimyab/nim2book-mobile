import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/env/env.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nim2book_mobile_flutter/core/bloc/books/books_cubit.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class AddBookScreen extends StatefulWidget {
  final Book? initialBook;
  const AddBookScreen({super.key, this.initialBook});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  PlatformFile? _selectedFile;
  bool _isUploading = false;
  final _apiClient = GetIt.I.get<ApiClient>();
  final _apiBaseUrl = GetIt.I.get<Env>().apiBaseUrl;
  String? _initialCoverUrl;

  @override
  void initState() {
    super.initState();
    final book = widget.initialBook;
    if (book?.cover != null) {
      _initialCoverUrl =
          '$_apiBaseUrl/api/v1/file/public?path=${Uri.encodeComponent(book!.cover!)}';
      // Предзагрузка обложки для мгновенного отображения
      precacheImage(CachedNetworkImageProvider(_initialCoverUrl!), context);
    }
  }

  Future<void> _pickFile() async {
    final l10n = AppLocalizations.of(context)!;

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['epub'],
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          _selectedFile = result.files.first;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${l10n.fileSelectionError}: $e')),
        );
      }
    }
  }

  Future<void> _uploadBook(
    final void Function(Book book) callbackWithBook,
  ) async {
    final l10n = AppLocalizations.of(context)!;

    if (_selectedFile == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.pleaseSelectFile)));
      return;
    }

    setState(() {
      _isUploading = true;
    });

    try {
      final response = await _apiClient.translateBook(
        file: File(_selectedFile!.path!),
        from: 'en',
        to: 'ru',
      );
      if (!mounted) return;
      if (response.book != null) {
        final book = response.book!;
        final coverUrl = book.cover != null
            ? '$_apiBaseUrl/api/v1/file/public?path=${Uri.encodeComponent(book.cover!)}'
            : null;
        if (coverUrl != null) {
          await precacheImage(CachedNetworkImageProvider(coverUrl), context);
        }
        callbackWithBook(book);
        return;
      }
      if (response.messageAboutTranslate != null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.messageAboutTranslate!)),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('${l10n.bookUploadError}: $e')));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.addBook)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_initialCoverUrl != null)
              Center(
                child: Image(
                  image: CachedNetworkImageProvider(_initialCoverUrl!),
                  height: 160,
                  width: 110,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (final context, final error, final stackTrace) =>
                          Image.asset(
                            'assets/placeholder_book_cover.jpg',
                            height: 160,
                            width: 110,
                            fit: BoxFit.cover,
                          ),
                ),
              ),
            if (_initialCoverUrl != null) const SizedBox(height: 16),
            Text(
              l10n.selectEpubFile,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: isDark ? 2 : 1,
              color: colorScheme.surface,
              child: InkWell(
                onTap: _isUploading ? null : _pickFile,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.file_upload_outlined,
                        size: 64,
                        color: _isUploading
                            ? colorScheme.onSurface.withValues(alpha: 0.5)
                            : colorScheme.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _selectedFile == null
                            ? l10n.tapToSelectFile
                            : _selectedFile!.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: _selectedFile != null
                              ? FontWeight.w500
                              : FontWeight.normal,
                          color: _selectedFile == null
                              ? colorScheme.onSurfaceVariant
                              : colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (_selectedFile != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          '${(_selectedFile!.size / 1024 / 1024).toStringAsFixed(2)} MB',
                          style: TextStyle(
                            fontSize: 12,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _isUploading
                  ? null
                  : () {
                      _uploadBook((final book) {
                        context.read<BooksCubit>().addMyBook(book);
                        context.go('/my-books');
                      });
                    },
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: _isUploading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          colorScheme.onPrimary,
                        ),
                      ),
                    )
                  : Text(l10n.uploadBook),
            ),
          ],
        ),
      ),
    );
  }
}
