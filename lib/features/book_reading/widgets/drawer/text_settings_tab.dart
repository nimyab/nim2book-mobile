import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/bloc/reading_settings_cubit.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

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
    final settings = context.select((final ReadingSettingsCubit c) => c.state);

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
                        value: settings.fontFamily,
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
                        onChanged: (final v) => context
                            .read<ReadingSettingsCubit>()
                            .setFontFamily(v ?? 'System'),
                      ),
                    ),
                    TextButton(
                      onPressed: () => context
                          .read<ReadingSettingsCubit>()
                          .setFontFamily('System'),
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
                        value: settings.textAlign,
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
                        onChanged: (final v) => context
                            .read<ReadingSettingsCubit>()
                            .setTextAlign(v ?? TextAlign.justify),
                      ),
                    ),
                    TextButton(
                      onPressed: () => context
                          .read<ReadingSettingsCubit>()
                          .setTextAlign(TextAlign.justify),
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              ListTile(
                title: Text(
                  l10n.fontSizeValue(
                    (_localFontSize ?? settings.fontSize).round(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _localFontSize ?? settings.fontSize,
                        min: 12,
                        max: 32,
                        divisions: 20,
                        label:
                            '${(_localFontSize ?? settings.fontSize).round()}',
                        onChanged: (final v) =>
                            setState(() => _localFontSize = v),
                        onChangeEnd: (final v) {
                          context.read<ReadingSettingsCubit>().setFontSize(v);
                          setState(() => _localFontSize = null);
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _localFontSize = null);
                        context.read<ReadingSettingsCubit>().setFontSize(24);
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
                            onTap: () => context
                                .read<ReadingSettingsCubit>()
                                .setBackgroundColor(c),
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: c,
                              child: c == settings.backgroundColor
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
                      onPressed: () => context
                          .read<ReadingSettingsCubit>()
                          .setBackgroundColor(theme.colorScheme.surface),
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
                            onTap: () => context
                                .read<ReadingSettingsCubit>()
                                .setTextColor(c),
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: c,
                              child: c == settings.textColor
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
                      onPressed: () =>
                          context.read<ReadingSettingsCubit>().setTextColor(
                            theme.textTheme.bodyLarge?.color ??
                                theme.colorScheme.onSurface,
                          ),
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              ListTile(
                title: Text(
                  l10n.lineHeightValue(
                    (_localLineHeight ?? settings.lineHeight).toStringAsFixed(
                      2,
                    ),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _localLineHeight ?? settings.lineHeight,
                        min: 1.0,
                        max: 2.0,
                        divisions: 20,
                        label: (_localLineHeight ?? settings.lineHeight)
                            .toStringAsFixed(2),
                        onChanged: (final v) =>
                            setState(() => _localLineHeight = v),
                        onChangeEnd: (final v) {
                          context.read<ReadingSettingsCubit>().setLineHeight(v);
                          setState(() => _localLineHeight = null);
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _localLineHeight = null);
                        context.read<ReadingSettingsCubit>().setLineHeight(1.3);
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
                    (_localSidePadding ?? settings.sidePadding).round(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _localSidePadding ?? settings.sidePadding,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label:
                            '${(_localSidePadding ?? settings.sidePadding).round()} px',
                        onChanged: (final v) =>
                            setState(() => _localSidePadding = v),
                        onChangeEnd: (final v) {
                          context.read<ReadingSettingsCubit>().setSidePadding(
                            v,
                          );
                          setState(() => _localSidePadding = null);
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _localSidePadding = null);
                        context.read<ReadingSettingsCubit>().setSidePadding(10);
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
                    (_localFirstLineIndent ?? settings.firstLineIndentEm)
                        .toStringAsFixed(1),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value:
                            _localFirstLineIndent ?? settings.firstLineIndentEm,
                        min: 0.0,
                        max: 3.0,
                        divisions: 30,
                        label:
                            '${(_localFirstLineIndent ?? settings.firstLineIndentEm).toStringAsFixed(1)} em',
                        onChanged: (final v) =>
                            setState(() => _localFirstLineIndent = v),
                        onChangeEnd: (final v) {
                          context
                              .read<ReadingSettingsCubit>()
                              .setFirstLineIndentEm(v);
                          setState(() => _localFirstLineIndent = null);
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _localFirstLineIndent = null);
                        context
                            .read<ReadingSettingsCubit>()
                            .setFirstLineIndentEm(1.5);
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
                    (_localParagraphSpacing ?? settings.paragraphSpacing)
                        .round(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value:
                            _localParagraphSpacing ?? settings.paragraphSpacing,
                        min: 0,
                        max: 24,
                        divisions: 24,
                        label:
                            '${(_localParagraphSpacing ?? settings.paragraphSpacing).round()} px',
                        onChanged: (final v) =>
                            setState(() => _localParagraphSpacing = v),
                        onChangeEnd: (final v) {
                          context
                              .read<ReadingSettingsCubit>()
                              .setParagraphSpacing(v);
                          setState(() => _localParagraphSpacing = null);
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _localParagraphSpacing = null);
                        context
                            .read<ReadingSettingsCubit>()
                            .setParagraphSpacing(7);
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
                            settings.translatedVerticalPadding)
                        .round(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value:
                            _localTranslatedVerticalPadding ??
                            settings.translatedVerticalPadding,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label:
                            '${(_localTranslatedVerticalPadding ?? settings.translatedVerticalPadding).round()} px',
                        onChanged: (final v) =>
                            setState(() => _localTranslatedVerticalPadding = v),
                        onChangeEnd: (final v) {
                          context
                              .read<ReadingSettingsCubit>()
                              .setTranslatedVerticalPadding(v);
                          setState(
                            () => _localTranslatedVerticalPadding = null,
                          );
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _localTranslatedVerticalPadding = null);
                        context
                            .read<ReadingSettingsCubit>()
                            .setTranslatedVerticalPadding(5);
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
                        value: settings.translatedFontFamily,
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
                        onChanged: (final v) => context
                            .read<ReadingSettingsCubit>()
                            .setTranslatedFontFamily(v ?? 'System'),
                      ),
                    ),
                    TextButton(
                      onPressed: () => context
                          .read<ReadingSettingsCubit>()
                          .setTranslatedFontFamily('System'),
                      child: Text(l10n.reset),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              ListTile(
                title: Text(
                  l10n.translationFontSizeValue(
                    (_localTranslatedFontSize ?? settings.translatedFontSize)
                        .round(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value:
                            _localTranslatedFontSize ??
                            settings.translatedFontSize,
                        min: 12,
                        max: 32,
                        divisions: 20,
                        label:
                            '${(_localTranslatedFontSize ?? settings.translatedFontSize).round()}',
                        onChanged: (final v) =>
                            setState(() => _localTranslatedFontSize = v),
                        onChangeEnd: (final v) {
                          context
                              .read<ReadingSettingsCubit>()
                              .setTranslatedFontSize(v);
                          setState(() => _localTranslatedFontSize = null);
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _localTranslatedFontSize = null);
                        context
                            .read<ReadingSettingsCubit>()
                            .setTranslatedFontSize(20);
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
