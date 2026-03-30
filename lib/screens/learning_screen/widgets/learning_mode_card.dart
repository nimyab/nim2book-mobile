import 'package:flutter/material.dart';

class LearningModeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool enabled;
  final ThemeData theme;
  final VoidCallback onTap;

  const LearningModeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.enabled,
    required this.theme,
    required this.onTap,
    this.subtitle,
  });

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: enabled
              ? null
              : theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.38),
        ),
        title: Text(title),
        subtitle: subtitle == null ? null : Text(subtitle!),
        onTap: onTap,
      ),
    );
  }
}
