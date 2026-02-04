import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/providers/book/books_provider.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class AddBookScreen extends ConsumerStatefulWidget {
  const AddBookScreen({super.key});

  @override
  ConsumerState<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends ConsumerState<AddBookScreen> {
  PlatformFile? _selectedFile;
  bool _isUploading = false;
  String? _initialCoverUrl;

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

  Future<void> _uploadBook(void Function() callback) async {
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

    final apiClient = ref.read(apiClientProvider);

    try {
      final response = await apiClient.translatePersonalUserBook(
        file: File(_selectedFile!.path!),
        from: 'en',
        to: 'ru',
      );
      if (!mounted) return;
      if (response.book != null) {
        final book = response.book!;
        final apiBaseUrl = ref.read(envProvider).apiBaseUrl;
        final coverUrl = book.cover != null
            ? '$apiBaseUrl/api/v1/file/public?path=${Uri.encodeComponent(book.cover!)}'
            : null;
        if (coverUrl != null) {
          await precacheImage(CachedNetworkImageProvider(coverUrl), context);
        }
        callback();
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
                      _uploadBook(() {
                        ref
                            .read(booksNotifierProvider.notifier)
                            .getPersonalBooks();
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
