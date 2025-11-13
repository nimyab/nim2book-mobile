import 'package:nim2book_mobile_flutter/features/srs/models/srs_item.dart';

// Периоды для статистики
enum StatsPeriod { last7, last30, last90, thisYear, allTime }

class StatsRange {
  final DateTime start;
  final DateTime end;
  final int bucketDays;
  const StatsRange(this.start, this.end, this.bucketDays);
}

bool isInRange(
  final DateTime d,
  final DateTime start,
  final DateTime endInclusive,
) {
  final ds = DateTime(d.year, d.month, d.day);
  final s = DateTime(start.year, start.month, start.day);
  final e = DateTime(endInclusive.year, endInclusive.month, endInclusive.day);
  return !ds.isBefore(s) && !ds.isAfter(e);
}

/// Вычисляет период и размер корзины для статистики.
StatsRange computeRange(
  final List<SrsItem> items,
  final DateTime now,
  final StatsPeriod period,
) {
  final today = DateTime(now.year, now.month, now.day);
  switch (period) {
    case StatsPeriod.last7:
      return StatsRange(today.subtract(const Duration(days: 6)), today, 1);
    case StatsPeriod.last30:
      return StatsRange(today.subtract(const Duration(days: 29)), today, 1);
    case StatsPeriod.last90:
      return StatsRange(today.subtract(const Duration(days: 89)), today, 1);
    case StatsPeriod.thisYear:
      final start = DateTime(today.year, 1, 1);
      final diff = today.difference(start).inDays + 1;
      return StatsRange(start, today, diff > 90 ? 7 : 1);
    case StatsPeriod.allTime:
      final reviewedDates = items
          .map((final i) => i.lastReviewedAt)
          .whereType<DateTime>()
          .toList();
      if (reviewedDates.isEmpty) {
        final start = today.subtract(const Duration(days: 89));
        return StatsRange(start, today, 7);
      }
      reviewedDates.sort((final a, final b) => a.compareTo(b));
      final start = DateTime(
        reviewedDates.first.year,
        reviewedDates.first.month,
        reviewedDates.first.day,
      );
      final diff = today.difference(start).inDays + 1;
      return StatsRange(start, today, diff > 90 ? 7 : 1);
  }
}

List<DateTime> buildBuckets(
  final DateTime start,
  final DateTime end,
  final int bucketDays,
) {
  final buckets = <DateTime>[];
  var cursor = start;
  while (!cursor.isAfter(end)) {
    buckets.add(cursor);
    cursor = cursor.add(Duration(days: bucketDays));
  }
  return buckets;
}

List<int> countByBucket(
  final List<SrsItem> items,
  final List<DateTime> buckets,
  final int bucketDays,
) {
  final counts = List<int>.filled(buckets.length, 0);
  for (var i = 0; i < buckets.length; i++) {
    final start = buckets[i];
    final end = start.add(Duration(days: bucketDays - 1));
    final c = items.where((final item) {
      final d = item.lastReviewedAt;
      if (d == null) return false;
      return isInRange(d, start, end);
    }).length;
    counts[i] = c;
  }
  return counts;
}

List<int> countLearnedByBucket(
  final List<SrsItem> items,
  final List<DateTime> buckets,
  final int bucketDays,
) {
  final counts = List<int>.filled(buckets.length, 0);
  for (var i = 0; i < buckets.length; i++) {
    final start = buckets[i];
    final end = start.add(Duration(days: bucketDays - 1));
    final c = items.where((final item) {
      final d = item.lastReviewedAt;
      if (d == null) return false;
      final ds = DateTime(d.year, d.month, d.day);
      final s = DateTime(start.year, start.month, start.day);
      final e = DateTime(end.year, end.month, end.day);
      return !ds.isBefore(s) && !ds.isAfter(e) && item.repetition >= 3;
    }).length;
    counts[i] = c;
  }
  return counts;
}

List<int> countKnownByBucket(
  final List<SrsItem> items,
  final List<DateTime> buckets,
  final int bucketDays,
) {
  final counts = List<int>.filled(buckets.length, 0);
  for (var i = 0; i < buckets.length; i++) {
    final start = buckets[i];
    final end = start.add(Duration(days: bucketDays - 1));
    final c = items.where((final item) {
      final d = item.lastReviewedAt;
      if (d == null) return false;
      final ds = DateTime(d.year, d.month, d.day);
      final s = DateTime(start.year, start.month, start.day);
      final e = DateTime(end.year, end.month, end.day);
      return !ds.isBefore(s) && !ds.isAfter(e) && item.repetition >= 8;
    }).length;
    counts[i] = c;
  }
  return counts;
}
