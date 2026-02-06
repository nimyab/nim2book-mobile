import 'package:drift/drift.dart';

// Table for dictionary cards
class DictionaryCardsTable extends Table {
  TextColumn get word => text()();
  TextColumn get partOfSpeech => text()();
  TextColumn get wordDataJson => text()(); // JSON serialized DictionaryWord
  TextColumn get fsrsCardJson => text()(); // JSON serialized FSRS Card

  @override
  Set<Column> get primaryKey => {word, partOfSpeech};
}
