import 'package:flutter/material.dart';

class OriginalParagraphPainter extends CustomPainter {
  final TextPainter textPainter;
  final int? selectionStart;
  final int? selectionEnd;
  final Color? highlightColor;

  OriginalParagraphPainter({
    required this.textPainter,
    this.selectionStart,
    this.selectionEnd,
    this.highlightColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();

    if (selectionStart != null &&
        selectionEnd != null &&
        highlightColor != null) {
      final boxes = textPainter.getBoxesForSelection(
        TextSelection(baseOffset: selectionStart!, extentOffset: selectionEnd!),
      );
      final paint = Paint()..color = highlightColor!;
      for (final box in boxes) {
        final rect = Rect.fromLTWH(
          box.left,
          box.top,
          box.right - box.left,
          box.bottom - box.top,
        );
        canvas.drawRect(rect, paint);
      }
    }

    textPainter.paint(canvas, Offset.zero);
    canvas.restore();
  }

  @override
  bool shouldRepaint(OriginalParagraphPainter oldDelegate) {
    final rangeChanged =
        (oldDelegate.selectionStart != selectionStart) ||
        (oldDelegate.selectionEnd != selectionEnd);
    return oldDelegate.textPainter.text != textPainter.text ||
        rangeChanged ||
        oldDelegate.highlightColor != highlightColor;
  }
}
