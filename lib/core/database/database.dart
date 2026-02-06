import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:nim2book_mobile_flutter/core/database/schemas/dictionary_cards_table.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    DictionaryCardsTable,
  ],
)
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'nim2book_db');
  }
}
