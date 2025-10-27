import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 1,
      ),
      cardTheme: const CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      extensions: [TranslatedTextScrollColors.light, BookReadingColors.light],
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 1,
      ),
      cardTheme: const CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      extensions: [TranslatedTextScrollColors.dark, BookReadingColors.dark],
    );
  }
}

class TranslatedTextScrollColors
    extends ThemeExtension<TranslatedTextScrollColors> {
  const TranslatedTextScrollColors({required this.backgroundColor});

  final Color backgroundColor;

  static const TranslatedTextScrollColors light = TranslatedTextScrollColors(
    backgroundColor: Color.fromARGB(255, 205, 204, 197),
  );

  static const TranslatedTextScrollColors dark = TranslatedTextScrollColors(
    backgroundColor: Color.fromARGB(255, 66, 66, 66),
  );

  @override
  TranslatedTextScrollColors copyWith({
    Color? backgroundColor,
    Color? highlightColor,
  }) {
    return TranslatedTextScrollColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  TranslatedTextScrollColors lerp(TranslatedTextScrollColors? other, double t) {
    if (other is! TranslatedTextScrollColors) {
      return this;
    }
    return TranslatedTextScrollColors(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }
}

class BookReadingColors extends ThemeExtension<BookReadingColors> {
  const BookReadingColors({
    required this.highlightBackgroundColor,
    required this.highlightTextColor,
  });

  final Color highlightBackgroundColor;
  final Color highlightTextColor;

  static const BookReadingColors light = BookReadingColors(
    highlightBackgroundColor: Colors.yellow,
    highlightTextColor: Colors.black87,
  );

  static const BookReadingColors dark = BookReadingColors(
    highlightBackgroundColor: Colors.indigo,
    highlightTextColor: Colors.white,
  );

  @override
  BookReadingColors copyWith({
    Color? highlightBackgroundColor,
    Color? highlightTextColor,
  }) {
    return BookReadingColors(
      highlightBackgroundColor:
          highlightBackgroundColor ?? this.highlightBackgroundColor,
      highlightTextColor: highlightTextColor ?? this.highlightTextColor,
    );
  }

  @override
  BookReadingColors lerp(BookReadingColors? other, double t) {
    if (other is! BookReadingColors) return this;
    return BookReadingColors(
      highlightBackgroundColor: Color.lerp(
        highlightBackgroundColor,
        other.highlightBackgroundColor,
        t,
      )!,
      highlightTextColor: Color.lerp(
        highlightTextColor,
        other.highlightTextColor,
        t,
      )!,
    );
  }
}
