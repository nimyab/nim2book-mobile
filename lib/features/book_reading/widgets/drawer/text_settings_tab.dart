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
  @override
  Widget build(BuildContext context) {
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
              // Font family
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
                          DropdownMenuItem(
                            value: 'NotoSerif',
                            child: Text('Noto Serif'),
                          ),
                          DropdownMenuItem(
                            value: 'Merriweather',
                            child: Text('Merriweather'),
                          ),
                          DropdownMenuItem(
                            value: 'Roboto',
                            child: Text('Roboto'),
                          ),
                        ],
                        onChanged: (v) =>
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

              // Text alignment
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
                        onChanged: (v) => readingSettingsContext.textAlign =
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

              // Font size
              ListTile(
                title: Text(
                  l10n.fontSizeValue(readingSettingsContext.fontSize.round()),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: readingSettingsContext.fontSize,
                        min: 12,
                        max: 32,
                        divisions: 20,
                        label: '${readingSettingsContext.fontSize.round()}',
                        onChanged: (v) => readingSettingsContext.fontSize = v,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        readingSettingsContext.fontSize = 24;
                      },
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              // Background color
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

              // Text color
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

              // Line height
              ListTile(
                title: Text(
                  l10n.lineHeightValue(
                    readingSettingsContext.lineHeight.toStringAsFixed(2),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: readingSettingsContext.lineHeight,
                        min: 1.0,
                        max: 2.0,
                        divisions: 20,
                        label: readingSettingsContext.lineHeight
                            .toStringAsFixed(2),
                        onChanged: (v) => readingSettingsContext.lineHeight = v,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        readingSettingsContext.lineHeight = 1.3;
                      },
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              // Side padding
              ListTile(
                title: Text(
                  l10n.sidePaddingPx(
                    readingSettingsContext.sidePadding.round(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: readingSettingsContext.sidePadding,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label:
                            '${readingSettingsContext.sidePadding.round()} px',
                        onChanged: (v) =>
                            readingSettingsContext.sidePadding = v,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        readingSettingsContext.sidePadding = 10;
                      },
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              // First line indent
              ListTile(
                title: Text(
                  l10n.firstLineIndentEm(
                    readingSettingsContext.firstLineIndentEm.toStringAsFixed(1),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: readingSettingsContext.firstLineIndentEm,
                        min: 0.0,
                        max: 3.0,
                        divisions: 30,
                        label:
                            '${readingSettingsContext.firstLineIndentEm.toStringAsFixed(1)} em',
                        onChanged: (v) => setState(
                          () => readingSettingsContext.firstLineIndentEm = v,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        readingSettingsContext.firstLineIndentEm = 1.5;
                      },
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              // Paragraph spacing
              ListTile(
                title: Text(
                  l10n.paragraphSpacingPx(
                    readingSettingsContext.paragraphSpacing.round(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: readingSettingsContext.paragraphSpacing,
                        min: 0,
                        max: 24,
                        divisions: 24,
                        label:
                            '${readingSettingsContext.paragraphSpacing.round()} px',
                        onChanged: (v) => setState(
                          () => readingSettingsContext.paragraphSpacing = v,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
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
              // Vertical padding for translation (top & bottom)
              ListTile(
                title: Text(
                  l10n.translationVerticalPaddingPx(
                    readingSettingsContext.translatedVerticalPadding.round(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: readingSettingsContext.translatedVerticalPadding,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label:
                            '${readingSettingsContext.translatedVerticalPadding.round()} px',
                        onChanged: (v) => setState(
                          () =>
                              readingSettingsContext.translatedVerticalPadding =
                                  v,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        readingSettingsContext.translatedVerticalPadding = 5;
                      },
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              // Font family for translation
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
                          DropdownMenuItem(
                            value: 'NotoSerif',
                            child: Text('Noto Serif'),
                          ),
                          DropdownMenuItem(
                            value: 'Merriweather',
                            child: Text('Merriweather'),
                          ),
                          DropdownMenuItem(
                            value: 'Roboto',
                            child: Text('Roboto'),
                          ),
                        ],
                        onChanged: (v) =>
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

              // Font size for translation
              ListTile(
                title: Text(
                  l10n.translationFontSizeValue(
                    readingSettingsContext.translatedFontSize.round(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: readingSettingsContext.translatedFontSize,
                        min: 12,
                        max: 32,
                        divisions: 20,
                        label:
                            '${readingSettingsContext.translatedFontSize.round()}',
                        onChanged: (v) =>
                            readingSettingsContext.translatedFontSize = v,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
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
