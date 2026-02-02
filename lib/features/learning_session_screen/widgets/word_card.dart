import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/widgets/word_card_content.dart';

class WordCard extends StatefulWidget {
  final DictionaryCard card;
  final bool showTranslation;
  final VoidCallback onToggleTranslation;
  final VoidCallback onKnow;
  final VoidCallback onDontKnow;

  const WordCard({
    super.key,
    required this.card,
    required this.showTranslation,
    required this.onToggleTranslation,
    required this.onKnow,
    required this.onDontKnow,
  });

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> with TickerProviderStateMixin {
  late AnimationController _swipeController;
  late AnimationController _resetController;

  final ValueNotifier<double> _dragXNotifier = ValueNotifier(0.0);
  final ValueNotifier<double> _dragYNotifier = ValueNotifier(0.0);
  final ValueNotifier<double> _rotationNotifier = ValueNotifier(0.0);
  final ValueNotifier<double> _scaleNotifier = ValueNotifier(1.0);
  final ValueNotifier<bool> _isDraggingNotifier = ValueNotifier(false);
  double _initialTouchX = 0.0;

  @override
  void initState() {
    super.initState();
    _swipeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _resetController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _swipeController.dispose();
    _resetController.dispose();
    _dragXNotifier.dispose();
    _dragYNotifier.dispose();
    _rotationNotifier.dispose();
    _scaleNotifier.dispose();
    _isDraggingNotifier.dispose();
    super.dispose();
  }

  void _onPanStart(final DragStartDetails details) {
    _isDraggingNotifier.value = true;
    _initialTouchX = details.localPosition.dx;
  }

  void _onPanUpdate(final DragUpdateDetails details) {
    final currentTouchX = details.localPosition.dx;
    final touchDeltaX = currentTouchX - _initialTouchX;

    _dragXNotifier.value = touchDeltaX;
    _dragYNotifier.value = 0.0;
    _rotationNotifier.value = (touchDeltaX / 300) * 0.26;
    _scaleNotifier.value = 1.0 - (touchDeltaX.abs() / 1000).clamp(0.0, 0.1);
  }

  void _onPanEnd(final DragEndDetails details) {
    const threshold = 100.0;
    final velocity = details.velocity.pixelsPerSecond.dx;

    _isDraggingNotifier.value = false;

    final dragX = _dragXNotifier.value;
    if (dragX.abs() > threshold || velocity.abs() > 500) {
      if (dragX > 0 || velocity > 0) {
        _animateSwipeRight();
      } else {
        _animateSwipeLeft();
      }
    } else {
      _resetCard();
    }
  }

  void _animateSwipeRight() {
    _swipeController.forward().then((_) {
      _swipeController.reset();
      _resetCardImmediately();
      widget.onKnow();
    });
  }

  void _animateSwipeLeft() {
    _swipeController.forward().then((_) {
      _swipeController.reset();
      _resetCardImmediately();
      widget.onDontKnow();
    });
  }

  void _resetCard() {
    _resetController.forward().then((_) {
      _dragXNotifier.value = 0.0;
      _dragYNotifier.value = 0.0;
      _rotationNotifier.value = 0.0;
      _scaleNotifier.value = 1.0;
      _resetController.reset();
    });
  }

  void _resetCardImmediately() {
    _dragXNotifier.value = 0.0;
    _dragYNotifier.value = 0.0;
    _rotationNotifier.value = 0.0;
    _scaleNotifier.value = 1.0;
  }

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);

    final staticContent = RepaintBoundary(
      child: WordCardContent(
        card: widget.card,
        showTranslation: widget.showTranslation,
      ),
    );

    return GestureDetector(
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _swipeController,
          _resetController,
          _dragXNotifier,
          _dragYNotifier,
          _rotationNotifier,
          _scaleNotifier,
          _isDraggingNotifier,
        ]),
        child: staticContent,
        builder: (final context, final child) {
          final dragX = _dragXNotifier.value;
          final dragY = _dragYNotifier.value;
          final rotation = _rotationNotifier.value;
          final scale = _scaleNotifier.value;
          final isDragging = _isDraggingNotifier.value;

          var finalX = dragX;
          var finalY = dragY;
          var finalRotation = rotation;
          var finalScale = scale;

          if (_swipeController.isAnimating) {
            final swipeProgress = _swipeController.value;
            final swipeDirection = dragX > 0 ? 1.0 : -1.0;
            finalX = dragX + (swipeDirection * 400 * swipeProgress);
            finalY = dragY + (200 * swipeProgress);
            finalRotation = rotation + (swipeDirection * 0.5 * swipeProgress);
            finalScale = scale - (0.3 * swipeProgress);
          }

          if (_resetController.isAnimating) {
            final resetProgress = _resetController.value;
            finalX = dragX * (1 - resetProgress);
            finalY = dragY * (1 - resetProgress);
            finalRotation = rotation * (1 - resetProgress);
            finalScale = scale + ((1.0 - scale) * resetProgress);
          }

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..translateByDouble(finalX, finalY, 1.0, 1.0)
              ..rotateZ(finalRotation)
              ..scaleByDouble(finalScale, finalScale, 1.0, 1.0),
            child: Stack(
              children: [
                if (!isDragging && dragX.abs() < 50) ...[
                  Positioned(
                    top: 10,
                    left: 5,
                    right: 5,
                    child: Transform.scale(
                      scale: 0.95,
                      child: Opacity(
                        opacity: 0.3,
                        child: Card(
                          elevation: 2,
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: theme.colorScheme.surfaceContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                GestureDetector(
                  onTap: widget.onToggleTranslation,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: isDragging && dragX.abs() > 50
                          ? Border.all(
                              color: (dragX > 0
                                  ? theme.colorScheme.primary.withValues(
                                      alpha: 0.6,
                                    )
                                  : theme.colorScheme.error.withValues(
                                      alpha: 0.6,
                                    )),
                              width: 3,
                            )
                          : null,
                    ),
                    child: Card(
                      clipBehavior: Clip.none,
                      elevation: isDragging ? 12 : 8,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: theme.colorScheme.surfaceContainer,
                        ),
                        child: child,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
