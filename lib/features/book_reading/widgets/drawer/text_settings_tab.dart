import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/reading_settings_context.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class TextSettingsTab extends StatefulWidget {
  const TextSettingsTab({super.key});

  @override
  State<TextSettingsTab> createState() => _TextSettingsTabState();
}

class _TextSettingsTabState extends State<TextSettingsTab> {
  double? _localFontSize;
  double? _localLineHeight;
  double? _localSidePadding;
  double? _localFirstLineIndent;
  double? _localParagraphSpacing;
  double? _localTranslatedVerticalPadding;
  double? _localTranslatedFontSize;

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final readingSettingsContext = context.watch<ReadingSettingsContext>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const SizedBox(height: 4),
          ExpansionTile(
            title: Text(l10n.bookTextSettings),
            initiallyExpanded: false,
            children: [
              ListTile(
                title: Text(l10n.font),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        value: readingSettingsContext.fontFamily,
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(
                            value: 'System',
                            child: Text(l10n.system),
                          ),
                          const DropdownMenuItem(
                            value: 'NotoSerif',
                            child: Text('Noto Serif'),
                          ),
                          const DropdownMenuItem(
                            value: 'Merriweather',
                            child: Text('Merriweather'),
                          ),
                          const DropdownMenuItem(
                            value: 'Roboto',
                            child: Text('Roboto'),
                          ),
                        ],
                        onChanged: (final v) =>
                            readingSettingsContext.fontFamily = v ?? 'System',
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          readingSettingsContext.fontFamily = 'System',
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              ListTile(
                title: Text(l10n.textAlignment),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: DropdownButton<TextAlign>(
                        value: readingSettingsContext.textAlign,
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(
                            value: TextAlign.left,
                            child: Text(l10n.alignLeft),
                          ),
                          DropdownMenuItem(
                            value: TextAlign.center,
                            child: Text(l10n.alignCenter),
                          ),
                          DropdownMenuItem(
                            value: TextAlign.right,
                            child: Text(l10n.alignRight),
                          ),
                          DropdownMenuItem(
                            value: TextAlign.justify,
                            child: Text(l10n.alignJustify),
                          ),
                        ],
                        onChanged: (final v) =>
                            readingSettingsContext.textAlign =
                                v ?? TextAlign.justify,
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          readingSettingsContext.textAlign = TextAlign.justify,
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              ListTile(
                title: Text(
                  l10n.fontSizeValue(
                    (_localFontSize ?? readingSettingsContext.fontSize).round(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value:
                            _localFontSize ?? readingSettingsContext.fontSize,
                        min: 12,
                        max: 32,
                        divisions: 20,
                        label:
                            '${(_localFontSize ?? readingSettingsContext.fontSize).round()}',
                        onChanged: (final v) =>
                            setState(() => _localFontSize = v),
                        onChangeEnd: (final v) {
                          readingSettingsContext.fontSize = v;
                          setState(() => _localFontSize = null);
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _localFontSize = null);
                        readingSettingsContext.fontSize = 24;
                      },
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              ListTile(
                title: Text(l10n.backgroundColor),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final c in [
                          theme.colorScheme.surface,
                          Colors.white,
                          Colors.black,
                          Colors.grey,
                          Colors.amberAccent.shade100,
                        ])
                          GestureDetector(
                            onTap: () =>
                                readingSettingsContext.backgroundColor = c,
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: c,
                              child: c == readingSettingsContext.backgroundColor
                                  ? const Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ),
                      ],
                    ),
                    TextButton(
                      onPressed: () => readingSettingsContext.backgroundColor =
                          theme.colorScheme.surface,
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              ListTile(
                title: Text(l10n.textColor),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final c in [
                          theme.textTheme.bodyLarge?.color ??
                              theme.colorScheme.onSurface,
                          Colors.black,
                          Colors.white,
                          Colors.brown,
                        ])
                          GestureDetector(
                            onTap: () => readingSettingsContext.textColor = c,
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: c,
                              child: c == readingSettingsContext.textColor
                                  ? Icon(
                                      Icons.check,
                                      size: 16,
                                      color: c.computeLuminance() < 0.5
                                          ? Colors.white
                                          : Colors.black,
                                    )
                                  : null,
                            ),
                          ),
                      ],
                    ),
                    TextButton(
                      onPressed: () => readingSettingsContext.textColor =
                          theme.textTheme.bodyLarge?.color ??
                          theme.colorScheme.onSurface,
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              ListTile(
                title: Text(
                  l10n.lineHeightValue(
                    (_localLineHeight ?? readingSettingsContext.lineHeight)
                        .toStringAsFixed(2),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value:
                            _localLineHeight ??
                            readingSettingsContext.lineHeight,
                        min: 1.0,
                        max: 2.0,
                        divisions: 20,
                        label:
                            (_localLineHeight ??
                                    readingSettingsContext.lineHeight)
                                .toStringAsFixed(2),
                        onChanged: (final v) =>
                            setState(() => _localLineHeight = v),
                        onChangeEnd: (final v) {
                          readingSettingsContext.lineHeight = v;
                          setState(() => _localLineHeight = null);
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _localLineHeight = null);
                        readingSettingsContext.lineHeight = 1.3;
                      },
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              ListTile(
                title: Text(
                  l10n.sidePaddingPx(
                    (_localSidePadding ?? readingSettingsContext.sidePadding)
                        .round(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value:
                            _localSidePadding ??
                            readingSettingsContext.sidePadding,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label:
                            '${(_localSidePadding ?? readingSettingsContext.sidePadding).round()} px',
                        onChanged: (final v) =>
                            setState(() => _localSidePadding = v),
                        onChangeEnd: (final v) {
                          readingSettingsContext.sidePadding = v;
                          setState(() => _localSidePadding = null);
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _localSidePadding = null);
                        readingSettingsContext.sidePadding = 10;
                      },
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              ListTile(
                title: Text(
                  l10n.firstLineIndentEm(
                    (_localFirstLineIndent ??
                            readingSettingsContext.firstLineIndentEm)
                        .toStringAsFixed(1),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value:
                            _localFirstLineIndent ??
                            readingSettingsContext.firstLineIndentEm,
                        min: 0.0,
                        max: 3.0,
                        divisions: 30,
                        label:
                            '${(_localFirstLineIndent ?? readingSettingsContext.firstLineIndentEm).toStringAsFixed(1)} em',
                        onChanged: (final v) =>
                            setState(() => _localFirstLineIndent = v),
                        onChangeEnd: (final v) {
                          readingSettingsContext.firstLineIndentEm = v;
                          setState(() => _localFirstLineIndent = null);
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _localFirstLineIndent = null);
                        readingSettingsContext.firstLineIndentEm = 1.5;
                      },
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              ListTile(
                title: Text(
                  l10n.paragraphSpacingPx(
                    (_localParagraphSpacing ??
                            readingSettingsContext.paragraphSpacing)
                        .round(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value:
                            _localParagraphSpacing ??
                            readingSettingsContext.paragraphSpacing,
                        min: 0,
                        max: 24,
                        divisions: 24,
                        label:
                            '${(_localParagraphSpacing ?? readingSettingsContext.paragraphSpacing).round()} px',
                        onChanged: (final v) =>
                            setState(() => _localParagraphSpacing = v),
                        onChangeEnd: (final v) {
                          readingSettingsContext.paragraphSpacing = v;
                          setState(() => _localParagraphSpacing = null);
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _localParagraphSpacing = null);
                        readingSettingsContext.paragraphSpacing = 7;
                      },
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ExpansionTile(
            title: Text(l10n.parallelTranslationHorizontalScroll),
            children: [
              ListTile(
                title: Text(
                  l10n.translationVerticalPaddingPx(
                    (_localTranslatedVerticalPadding ??
                            readingSettingsContext.translatedVerticalPadding)
                        .round(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value:
                            _localTranslatedVerticalPadding ??
                            readingSettingsContext.translatedVerticalPadding,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label:
                            '${(_localTranslatedVerticalPadding ?? readingSettingsContext.translatedVerticalPadding).round()} px',
                        onChanged: (final v) =>
                            setState(() => _localTranslatedVerticalPadding = v),
                        onChangeEnd: (final v) {
                          readingSettingsContext.translatedVerticalPadding = v;
                          setState(
                            () => _localTranslatedVerticalPadding = null,
                          );
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _localTranslatedVerticalPadding = null);
                        readingSettingsContext.translatedVerticalPadding = 5;
                      },
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              ListTile(
                title: Text(l10n.translationFont),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        value: readingSettingsContext.translatedFontFamily,
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(
                            value: 'System',
                            child: Text(l10n.system),
                          ),
                          const DropdownMenuItem(
                            value: 'NotoSerif',
                            child: Text('Noto Serif'),
                          ),
                          const DropdownMenuItem(
                            value: 'Merriweather',
                            child: Text('Merriweather'),
                          ),
                          const DropdownMenuItem(
                            value: 'Roboto',
                            child: Text('Roboto'),
                          ),
                        ],
                        onChanged: (final v) =>
                            readingSettingsContext.translatedFontFamily =
                                v ?? 'System',
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          readingSettingsContext.translatedFontFamily =
                              'System',
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              ListTile(
                title: Text(
                  l10n.translationFontSizeValue(
                    (_localTranslatedFontSize ??
                            readingSettingsContext.translatedFontSize)
                        .round(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value:
                            _localTranslatedFontSize ??
                            readingSettingsContext.translatedFontSize,
                        min: 12,
                        max: 32,
                        divisions: 20,
                        label:
                            '${(_localTranslatedFontSize ?? readingSettingsContext.translatedFontSize).round()}',
                        onChanged: (final v) =>
                            setState(() => _localTranslatedFontSize = v),
                        onChangeEnd: (final v) {
                          readingSettingsContext.translatedFontSize = v;
                          setState(() => _localTranslatedFontSize = null);
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _localTranslatedFontSize = null);
                        readingSettingsContext.translatedFontSize = 20;
                      },
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
