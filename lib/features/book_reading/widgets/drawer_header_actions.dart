import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class DrawerHeaderActions extends StatelessWidget {
  final bool isFullscreen;
  final VoidCallback onClose;
  final VoidCallback onToggleFullscreen;
  final VoidCallback onOpenSearch;

  const DrawerHeaderActions({
    super.key,
    required this.isFullscreen,
    required this.onClose,
    required this.onToggleFullscreen,
    required this.onOpenSearch,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            Tooltip(
              message: l10n.close,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: onClose,
              ),
            ),
            const Spacer(),
            Tooltip(
              message: isFullscreen ? 'Exit fullscreen' : 'Fullscreen',
              child: IconButton(
                icon: Icon(
                  isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
                ),
                onPressed: onToggleFullscreen,
              ),
            ),
            Tooltip(
              message: l10n.search,
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: onOpenSearch,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
