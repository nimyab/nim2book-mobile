import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class TextSettingsTab extends StatefulWidget {
  final String fontFamily;
  final ValueChanged<String> onFontFamilyChange;

  final double fontSize;
  final ValueChanged<double> onFontSizeChange;

  final Color backgroundColor;
  final ValueChanged<Color> onBackgroundColorChange;

  final Color textColor;
  final ValueChanged<Color> onTextColorChange;

  final double lineHeight;
  final ValueChanged<double> onLineHeightChange;

  final double sidePadding;
  final ValueChanged<double> onSidePaddingChange;

  final double firstLineIndentEm;
  final ValueChanged<double> onFirstLineIndentEmChange;

  final double paragraphSpacing;
  final ValueChanged<double> onParagraphSpacingChange;

  final ScrollController translatedController;

  final TextAlign textAlign;
  final ValueChanged<TextAlign> onTextAlignChange;

  final double translatedVerticalPadding;
  final ValueChanged<double> onTranslatedVerticalPaddingChange;
  final double translatedFontSize;
  final ValueChanged<double> onTranslatedFontSizeChange;
  final String translatedFontFamily;
  final ValueChanged<String> onTranslatedFontFamilyChange;

  const TextSettingsTab({
    super.key,
    required this.fontFamily,
    required this.onFontFamilyChange,
    required this.fontSize,
    required this.onFontSizeChange,
    required this.backgroundColor,
    required this.onBackgroundColorChange,
    required this.textColor,
    required this.onTextColorChange,
    required this.lineHeight,
    required this.onLineHeightChange,
    required this.sidePadding,
    required this.onSidePaddingChange,
    required this.firstLineIndentEm,
    required this.onFirstLineIndentEmChange,
    required this.paragraphSpacing,
    required this.onParagraphSpacingChange,
    required this.translatedController,
    required this.textAlign,
    required this.onTextAlignChange,
    required this.translatedVerticalPadding,
    required this.onTranslatedVerticalPaddingChange,
    required this.translatedFontSize,
    required this.onTranslatedFontSizeChange,
    required this.translatedFontFamily,
    required this.onTranslatedFontFamilyChange,
  });

  @override
  State<TextSettingsTab> createState() => _TextSettingsTabState();
}

class _TextSettingsTabState extends State<TextSettingsTab> {
  late double _fontSizePreview;
  late double _lineHeightPreview;
  late double _sidePaddingPreview;
  late double _firstLineIndentEmPreview;
  late double _paragraphSpacingPreview;
  late double _translatedVerticalPaddingPreview;
  late double _translatedFontSizePreview;

  @override
  void initState() {
    super.initState();
    _fontSizePreview = widget.fontSize;
    _lineHeightPreview = widget.lineHeight;
    _sidePaddingPreview = widget.sidePadding;
    _firstLineIndentEmPreview = widget.firstLineIndentEm;
    _paragraphSpacingPreview = widget.paragraphSpacing;
    _translatedVerticalPaddingPreview = widget.translatedVerticalPadding;
    _translatedFontSizePreview = widget.translatedFontSize;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

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
                        value: widget.fontFamily,
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
                            widget.onFontFamilyChange(v ?? 'System'),
                      ),
                    ),
                    TextButton(
                      onPressed: () => widget.onFontFamilyChange('System'),
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
                        value: widget.textAlign,
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
                        onChanged: (v) =>
                            widget.onTextAlignChange(v ?? TextAlign.justify),
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          widget.onTextAlignChange(TextAlign.justify),
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              // Font size
              ListTile(
                title: Text(l10n.fontSizeValue(_fontSizePreview.round())),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _fontSizePreview,
                        min: 12,
                        max: 32,
                        divisions: 20,
                        label: '${_fontSizePreview.round()}',
                        onChanged: (v) => setState(() => _fontSizePreview = v),
                        onChangeEnd: (v) => widget.onFontSizeChange(v),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _fontSizePreview = 24);
                        widget.onFontSizeChange(24);
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
                            onTap: () => widget.onBackgroundColorChange(c),
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: c,
                              child: c == widget.backgroundColor
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
                      onPressed: () => widget.onBackgroundColorChange(
                        theme.colorScheme.surface,
                      ),
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
                            onTap: () => widget.onTextColorChange(c),
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: c,
                              child: c == widget.textColor
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
                      onPressed: () => widget.onTextColorChange(
                        theme.textTheme.bodyLarge?.color ??
                            theme.colorScheme.onSurface,
                      ),
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              // Line height
              ListTile(
                title: Text(
                  l10n.lineHeightValue(_lineHeightPreview.toStringAsFixed(2)),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _lineHeightPreview,
                        min: 1.0,
                        max: 2.0,
                        divisions: 20,
                        label: _lineHeightPreview.toStringAsFixed(2),
                        onChanged: (v) =>
                            setState(() => _lineHeightPreview = v),
                        onChangeEnd: (v) => widget.onLineHeightChange(v),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _lineHeightPreview = 1.3);
                        widget.onLineHeightChange(1.3);
                      },
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              // Side padding
              ListTile(
                title: Text(l10n.sidePaddingPx(_sidePaddingPreview.round())),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _sidePaddingPreview,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label: '${_sidePaddingPreview.round()} px',
                        onChanged: (v) =>
                            setState(() => _sidePaddingPreview = v),
                        onChangeEnd: (v) => widget.onSidePaddingChange(v),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _sidePaddingPreview = 10);
                        widget.onSidePaddingChange(10);
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
                    _firstLineIndentEmPreview.toStringAsFixed(1),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _firstLineIndentEmPreview,
                        min: 0.0,
                        max: 3.0,
                        divisions: 30,
                        label:
                            '${_firstLineIndentEmPreview.toStringAsFixed(1)} em',
                        onChanged: (v) =>
                            setState(() => _firstLineIndentEmPreview = v),
                        onChangeEnd: (v) => widget.onFirstLineIndentEmChange(v),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _firstLineIndentEmPreview = 1.5);
                        widget.onFirstLineIndentEmChange(1.5);
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
                  l10n.paragraphSpacingPx(_paragraphSpacingPreview.round()),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _paragraphSpacingPreview,
                        min: 0,
                        max: 24,
                        divisions: 24,
                        label: '${_paragraphSpacingPreview.round()} px',
                        onChanged: (v) =>
                            setState(() => _paragraphSpacingPreview = v),
                        onChangeEnd: (v) => widget.onParagraphSpacingChange(v),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _paragraphSpacingPreview = 7);
                        widget.onParagraphSpacingChange(7);
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
                    _translatedVerticalPaddingPreview.round(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _translatedVerticalPaddingPreview,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label:
                            '${_translatedVerticalPaddingPreview.round()} px',
                        onChanged: (v) => setState(
                          () => _translatedVerticalPaddingPreview = v,
                        ),
                        onChangeEnd: (v) =>
                            widget.onTranslatedVerticalPaddingChange(v),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _translatedVerticalPaddingPreview = 5);
                        widget.onTranslatedVerticalPaddingChange(5);
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
                        value: widget.translatedFontFamily,
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
                            widget.onTranslatedFontFamilyChange(v ?? 'System'),
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          widget.onTranslatedFontFamilyChange('System'),
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
                    _translatedFontSizePreview.round(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _translatedFontSizePreview,
                        min: 12,
                        max: 32,
                        divisions: 20,
                        label: '${_translatedFontSizePreview.round()}',
                        onChanged: (v) =>
                            setState(() => _translatedFontSizePreview = v),
                        onChangeEnd: (v) =>
                            widget.onTranslatedFontSizeChange(v),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _translatedFontSizePreview = 20);
                        widget.onTranslatedFontSizeChange(20);
                      },
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(''),
                    TextButton(
                      onPressed: () => widget.translatedController.jumpTo(0),
                      child: Text(l10n.resetPosition),
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
