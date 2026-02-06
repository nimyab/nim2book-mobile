// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DictionaryCardsTableTable extends DictionaryCardsTable
    with TableInfo<$DictionaryCardsTableTable, DictionaryCardsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DictionaryCardsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
    'word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _partOfSpeechMeta = const VerificationMeta(
    'partOfSpeech',
  );
  @override
  late final GeneratedColumn<String> partOfSpeech = GeneratedColumn<String>(
    'part_of_speech',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wordDataJsonMeta = const VerificationMeta(
    'wordDataJson',
  );
  @override
  late final GeneratedColumn<String> wordDataJson = GeneratedColumn<String>(
    'word_data_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fsrsCardJsonMeta = const VerificationMeta(
    'fsrsCardJson',
  );
  @override
  late final GeneratedColumn<String> fsrsCardJson = GeneratedColumn<String>(
    'fsrs_card_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    word,
    partOfSpeech,
    wordDataJson,
    fsrsCardJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dictionary_cards_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<DictionaryCardsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('word')) {
      context.handle(
        _wordMeta,
        word.isAcceptableOrUnknown(data['word']!, _wordMeta),
      );
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('part_of_speech')) {
      context.handle(
        _partOfSpeechMeta,
        partOfSpeech.isAcceptableOrUnknown(
          data['part_of_speech']!,
          _partOfSpeechMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_partOfSpeechMeta);
    }
    if (data.containsKey('word_data_json')) {
      context.handle(
        _wordDataJsonMeta,
        wordDataJson.isAcceptableOrUnknown(
          data['word_data_json']!,
          _wordDataJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_wordDataJsonMeta);
    }
    if (data.containsKey('fsrs_card_json')) {
      context.handle(
        _fsrsCardJsonMeta,
        fsrsCardJson.isAcceptableOrUnknown(
          data['fsrs_card_json']!,
          _fsrsCardJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fsrsCardJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {word, partOfSpeech};
  @override
  DictionaryCardsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DictionaryCardsTableData(
      word: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word'],
      )!,
      partOfSpeech: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}part_of_speech'],
      )!,
      wordDataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word_data_json'],
      )!,
      fsrsCardJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fsrs_card_json'],
      )!,
    );
  }

  @override
  $DictionaryCardsTableTable createAlias(String alias) {
    return $DictionaryCardsTableTable(attachedDatabase, alias);
  }
}

class DictionaryCardsTableData extends DataClass
    implements Insertable<DictionaryCardsTableData> {
  final String word;
  final String partOfSpeech;
  final String wordDataJson;
  final String fsrsCardJson;
  const DictionaryCardsTableData({
    required this.word,
    required this.partOfSpeech,
    required this.wordDataJson,
    required this.fsrsCardJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['word'] = Variable<String>(word);
    map['part_of_speech'] = Variable<String>(partOfSpeech);
    map['word_data_json'] = Variable<String>(wordDataJson);
    map['fsrs_card_json'] = Variable<String>(fsrsCardJson);
    return map;
  }

  DictionaryCardsTableCompanion toCompanion(bool nullToAbsent) {
    return DictionaryCardsTableCompanion(
      word: Value(word),
      partOfSpeech: Value(partOfSpeech),
      wordDataJson: Value(wordDataJson),
      fsrsCardJson: Value(fsrsCardJson),
    );
  }

  factory DictionaryCardsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DictionaryCardsTableData(
      word: serializer.fromJson<String>(json['word']),
      partOfSpeech: serializer.fromJson<String>(json['partOfSpeech']),
      wordDataJson: serializer.fromJson<String>(json['wordDataJson']),
      fsrsCardJson: serializer.fromJson<String>(json['fsrsCardJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'word': serializer.toJson<String>(word),
      'partOfSpeech': serializer.toJson<String>(partOfSpeech),
      'wordDataJson': serializer.toJson<String>(wordDataJson),
      'fsrsCardJson': serializer.toJson<String>(fsrsCardJson),
    };
  }

  DictionaryCardsTableData copyWith({
    String? word,
    String? partOfSpeech,
    String? wordDataJson,
    String? fsrsCardJson,
  }) => DictionaryCardsTableData(
    word: word ?? this.word,
    partOfSpeech: partOfSpeech ?? this.partOfSpeech,
    wordDataJson: wordDataJson ?? this.wordDataJson,
    fsrsCardJson: fsrsCardJson ?? this.fsrsCardJson,
  );
  DictionaryCardsTableData copyWithCompanion(
    DictionaryCardsTableCompanion data,
  ) {
    return DictionaryCardsTableData(
      word: data.word.present ? data.word.value : this.word,
      partOfSpeech: data.partOfSpeech.present
          ? data.partOfSpeech.value
          : this.partOfSpeech,
      wordDataJson: data.wordDataJson.present
          ? data.wordDataJson.value
          : this.wordDataJson,
      fsrsCardJson: data.fsrsCardJson.present
          ? data.fsrsCardJson.value
          : this.fsrsCardJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DictionaryCardsTableData(')
          ..write('word: $word, ')
          ..write('partOfSpeech: $partOfSpeech, ')
          ..write('wordDataJson: $wordDataJson, ')
          ..write('fsrsCardJson: $fsrsCardJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(word, partOfSpeech, wordDataJson, fsrsCardJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DictionaryCardsTableData &&
          other.word == this.word &&
          other.partOfSpeech == this.partOfSpeech &&
          other.wordDataJson == this.wordDataJson &&
          other.fsrsCardJson == this.fsrsCardJson);
}

class DictionaryCardsTableCompanion
    extends UpdateCompanion<DictionaryCardsTableData> {
  final Value<String> word;
  final Value<String> partOfSpeech;
  final Value<String> wordDataJson;
  final Value<String> fsrsCardJson;
  final Value<int> rowid;
  const DictionaryCardsTableCompanion({
    this.word = const Value.absent(),
    this.partOfSpeech = const Value.absent(),
    this.wordDataJson = const Value.absent(),
    this.fsrsCardJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DictionaryCardsTableCompanion.insert({
    required String word,
    required String partOfSpeech,
    required String wordDataJson,
    required String fsrsCardJson,
    this.rowid = const Value.absent(),
  }) : word = Value(word),
       partOfSpeech = Value(partOfSpeech),
       wordDataJson = Value(wordDataJson),
       fsrsCardJson = Value(fsrsCardJson);
  static Insertable<DictionaryCardsTableData> custom({
    Expression<String>? word,
    Expression<String>? partOfSpeech,
    Expression<String>? wordDataJson,
    Expression<String>? fsrsCardJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (word != null) 'word': word,
      if (partOfSpeech != null) 'part_of_speech': partOfSpeech,
      if (wordDataJson != null) 'word_data_json': wordDataJson,
      if (fsrsCardJson != null) 'fsrs_card_json': fsrsCardJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DictionaryCardsTableCompanion copyWith({
    Value<String>? word,
    Value<String>? partOfSpeech,
    Value<String>? wordDataJson,
    Value<String>? fsrsCardJson,
    Value<int>? rowid,
  }) {
    return DictionaryCardsTableCompanion(
      word: word ?? this.word,
      partOfSpeech: partOfSpeech ?? this.partOfSpeech,
      wordDataJson: wordDataJson ?? this.wordDataJson,
      fsrsCardJson: fsrsCardJson ?? this.fsrsCardJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (partOfSpeech.present) {
      map['part_of_speech'] = Variable<String>(partOfSpeech.value);
    }
    if (wordDataJson.present) {
      map['word_data_json'] = Variable<String>(wordDataJson.value);
    }
    if (fsrsCardJson.present) {
      map['fsrs_card_json'] = Variable<String>(fsrsCardJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DictionaryCardsTableCompanion(')
          ..write('word: $word, ')
          ..write('partOfSpeech: $partOfSpeech, ')
          ..write('wordDataJson: $wordDataJson, ')
          ..write('fsrsCardJson: $fsrsCardJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $DictionaryCardsTableTable dictionaryCardsTable =
      $DictionaryCardsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dictionaryCardsTable];
}

typedef $$DictionaryCardsTableTableCreateCompanionBuilder =
    DictionaryCardsTableCompanion Function({
      required String word,
      required String partOfSpeech,
      required String wordDataJson,
      required String fsrsCardJson,
      Value<int> rowid,
    });
typedef $$DictionaryCardsTableTableUpdateCompanionBuilder =
    DictionaryCardsTableCompanion Function({
      Value<String> word,
      Value<String> partOfSpeech,
      Value<String> wordDataJson,
      Value<String> fsrsCardJson,
      Value<int> rowid,
    });

class $$DictionaryCardsTableTableFilterComposer
    extends Composer<_$Database, $DictionaryCardsTableTable> {
  $$DictionaryCardsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get partOfSpeech => $composableBuilder(
    column: $table.partOfSpeech,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wordDataJson => $composableBuilder(
    column: $table.wordDataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fsrsCardJson => $composableBuilder(
    column: $table.fsrsCardJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DictionaryCardsTableTableOrderingComposer
    extends Composer<_$Database, $DictionaryCardsTableTable> {
  $$DictionaryCardsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partOfSpeech => $composableBuilder(
    column: $table.partOfSpeech,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wordDataJson => $composableBuilder(
    column: $table.wordDataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fsrsCardJson => $composableBuilder(
    column: $table.fsrsCardJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DictionaryCardsTableTableAnnotationComposer
    extends Composer<_$Database, $DictionaryCardsTableTable> {
  $$DictionaryCardsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<String> get partOfSpeech => $composableBuilder(
    column: $table.partOfSpeech,
    builder: (column) => column,
  );

  GeneratedColumn<String> get wordDataJson => $composableBuilder(
    column: $table.wordDataJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fsrsCardJson => $composableBuilder(
    column: $table.fsrsCardJson,
    builder: (column) => column,
  );
}

class $$DictionaryCardsTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $DictionaryCardsTableTable,
          DictionaryCardsTableData,
          $$DictionaryCardsTableTableFilterComposer,
          $$DictionaryCardsTableTableOrderingComposer,
          $$DictionaryCardsTableTableAnnotationComposer,
          $$DictionaryCardsTableTableCreateCompanionBuilder,
          $$DictionaryCardsTableTableUpdateCompanionBuilder,
          (
            DictionaryCardsTableData,
            BaseReferences<
              _$Database,
              $DictionaryCardsTableTable,
              DictionaryCardsTableData
            >,
          ),
          DictionaryCardsTableData,
          PrefetchHooks Function()
        > {
  $$DictionaryCardsTableTableTableManager(
    _$Database db,
    $DictionaryCardsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DictionaryCardsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DictionaryCardsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$DictionaryCardsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> word = const Value.absent(),
                Value<String> partOfSpeech = const Value.absent(),
                Value<String> wordDataJson = const Value.absent(),
                Value<String> fsrsCardJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DictionaryCardsTableCompanion(
                word: word,
                partOfSpeech: partOfSpeech,
                wordDataJson: wordDataJson,
                fsrsCardJson: fsrsCardJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String word,
                required String partOfSpeech,
                required String wordDataJson,
                required String fsrsCardJson,
                Value<int> rowid = const Value.absent(),
              }) => DictionaryCardsTableCompanion.insert(
                word: word,
                partOfSpeech: partOfSpeech,
                wordDataJson: wordDataJson,
                fsrsCardJson: fsrsCardJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DictionaryCardsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $DictionaryCardsTableTable,
      DictionaryCardsTableData,
      $$DictionaryCardsTableTableFilterComposer,
      $$DictionaryCardsTableTableOrderingComposer,
      $$DictionaryCardsTableTableAnnotationComposer,
      $$DictionaryCardsTableTableCreateCompanionBuilder,
      $$DictionaryCardsTableTableUpdateCompanionBuilder,
      (
        DictionaryCardsTableData,
        BaseReferences<
          _$Database,
          $DictionaryCardsTableTable,
          DictionaryCardsTableData
        >,
      ),
      DictionaryCardsTableData,
      PrefetchHooks Function()
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$DictionaryCardsTableTableTableManager get dictionaryCardsTable =>
      $$DictionaryCardsTableTableTableManager(_db, _db.dictionaryCardsTable);
}
