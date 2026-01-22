import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@freezed
abstract class Genre with _$Genre {
  const factory Genre({
    required final String id,
    required final String name,
  }) = _Genre;

  factory Genre.fromJson(final Map<String, dynamic> json) =>
      _$GenreFromJson(json);
}
