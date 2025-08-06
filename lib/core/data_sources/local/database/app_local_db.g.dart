// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_local_db.dart';

// ignore_for_file: type=lint
class $PreferencesTableTable extends PreferencesTable
    with TableInfo<$PreferencesTableTable, PreferencesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreferencesTableTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumnWithTypeConverter<PreferenceType, String>
  preferenceType =
      GeneratedColumn<String>(
        'preference_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<PreferenceType>(
        $PreferencesTableTable.$converterpreferenceType,
      );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  static const VerificationMeta _isSelectedMeta = const VerificationMeta(
    'isSelected',
  );
  @override
  late final GeneratedColumn<bool> isSelected = GeneratedColumn<bool>(
    'is_selected',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_selected" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [preferenceType, name, isSelected];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'preferences_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PreferencesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_selected')) {
      context.handle(
        _isSelectedMeta,
        isSelected.isAcceptableOrUnknown(data['is_selected']!, _isSelectedMeta),
      );
    } else if (isInserting) {
      context.missing(_isSelectedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  PreferencesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PreferencesTableData(
      preferenceType: $PreferencesTableTable.$converterpreferenceType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}preference_type'],
        )!,
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isSelected: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_selected'],
      )!,
    );
  }

  @override
  $PreferencesTableTable createAlias(String alias) {
    return $PreferencesTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PreferenceType, String, String>
  $converterpreferenceType = const EnumNameConverter<PreferenceType>(
    PreferenceType.values,
  );
}

class PreferencesTableData extends DataClass
    implements Insertable<PreferencesTableData> {
  final PreferenceType preferenceType;
  final String name;
  final bool isSelected;
  const PreferencesTableData({
    required this.preferenceType,
    required this.name,
    required this.isSelected,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    {
      map['preference_type'] = Variable<String>(
        $PreferencesTableTable.$converterpreferenceType.toSql(preferenceType),
      );
    }
    map['name'] = Variable<String>(name);
    map['is_selected'] = Variable<bool>(isSelected);
    return map;
  }

  PreferencesTableCompanion toCompanion(bool nullToAbsent) {
    return PreferencesTableCompanion(
      preferenceType: Value(preferenceType),
      name: Value(name),
      isSelected: Value(isSelected),
    );
  }

  factory PreferencesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PreferencesTableData(
      preferenceType: $PreferencesTableTable.$converterpreferenceType.fromJson(
        serializer.fromJson<String>(json['preferenceType']),
      ),
      name: serializer.fromJson<String>(json['name']),
      isSelected: serializer.fromJson<bool>(json['isSelected']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'preferenceType': serializer.toJson<String>(
        $PreferencesTableTable.$converterpreferenceType.toJson(preferenceType),
      ),
      'name': serializer.toJson<String>(name),
      'isSelected': serializer.toJson<bool>(isSelected),
    };
  }

  PreferencesTableData copyWith({
    PreferenceType? preferenceType,
    String? name,
    bool? isSelected,
  }) => PreferencesTableData(
    preferenceType: preferenceType ?? this.preferenceType,
    name: name ?? this.name,
    isSelected: isSelected ?? this.isSelected,
  );
  PreferencesTableData copyWithCompanion(PreferencesTableCompanion data) {
    return PreferencesTableData(
      preferenceType: data.preferenceType.present
          ? data.preferenceType.value
          : this.preferenceType,
      name: data.name.present ? data.name.value : this.name,
      isSelected: data.isSelected.present
          ? data.isSelected.value
          : this.isSelected,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PreferencesTableData(')
          ..write('preferenceType: $preferenceType, ')
          ..write('name: $name, ')
          ..write('isSelected: $isSelected')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(preferenceType, name, isSelected);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PreferencesTableData &&
          other.preferenceType == this.preferenceType &&
          other.name == this.name &&
          other.isSelected == this.isSelected);
}

class PreferencesTableCompanion extends UpdateCompanion<PreferencesTableData> {
  final Value<PreferenceType> preferenceType;
  final Value<String> name;
  final Value<bool> isSelected;
  final Value<int> rowid;
  const PreferencesTableCompanion({
    this.preferenceType = const Value.absent(),
    this.name = const Value.absent(),
    this.isSelected = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PreferencesTableCompanion.insert({
    required PreferenceType preferenceType,
    required String name,
    required bool isSelected,
    this.rowid = const Value.absent(),
  }) : preferenceType = Value(preferenceType),
       name = Value(name),
       isSelected = Value(isSelected);
  static Insertable<PreferencesTableData> custom({
    Expression<String>? preferenceType,
    Expression<String>? name,
    Expression<bool>? isSelected,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (preferenceType != null) 'preference_type': preferenceType,
      if (name != null) 'name': name,
      if (isSelected != null) 'is_selected': isSelected,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PreferencesTableCompanion copyWith({
    Value<PreferenceType>? preferenceType,
    Value<String>? name,
    Value<bool>? isSelected,
    Value<int>? rowid,
  }) {
    return PreferencesTableCompanion(
      preferenceType: preferenceType ?? this.preferenceType,
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (preferenceType.present) {
      map['preference_type'] = Variable<String>(
        $PreferencesTableTable.$converterpreferenceType.toSql(
          preferenceType.value,
        ),
      );
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isSelected.present) {
      map['is_selected'] = Variable<bool>(isSelected.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreferencesTableCompanion(')
          ..write('preferenceType: $preferenceType, ')
          ..write('name: $name, ')
          ..write('isSelected: $isSelected, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PreferencesTableTable preferencesTable = $PreferencesTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [preferencesTable];
}

typedef $$PreferencesTableTableCreateCompanionBuilder =
    PreferencesTableCompanion Function({
      required PreferenceType preferenceType,
      required String name,
      required bool isSelected,
      Value<int> rowid,
    });
typedef $$PreferencesTableTableUpdateCompanionBuilder =
    PreferencesTableCompanion Function({
      Value<PreferenceType> preferenceType,
      Value<String> name,
      Value<bool> isSelected,
      Value<int> rowid,
    });

class $$PreferencesTableTableFilterComposer
    extends Composer<_$AppDatabase, $PreferencesTableTable> {
  $$PreferencesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<PreferenceType, PreferenceType, String>
  get preferenceType => $composableBuilder(
    column: $table.preferenceType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSelected => $composableBuilder(
    column: $table.isSelected,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PreferencesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PreferencesTableTable> {
  $$PreferencesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get preferenceType => $composableBuilder(
    column: $table.preferenceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSelected => $composableBuilder(
    column: $table.isSelected,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PreferencesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PreferencesTableTable> {
  $$PreferencesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<PreferenceType, String> get preferenceType =>
      $composableBuilder(
        column: $table.preferenceType,
        builder: (column) => column,
      );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isSelected => $composableBuilder(
    column: $table.isSelected,
    builder: (column) => column,
  );
}

class $$PreferencesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PreferencesTableTable,
          PreferencesTableData,
          $$PreferencesTableTableFilterComposer,
          $$PreferencesTableTableOrderingComposer,
          $$PreferencesTableTableAnnotationComposer,
          $$PreferencesTableTableCreateCompanionBuilder,
          $$PreferencesTableTableUpdateCompanionBuilder,
          (
            PreferencesTableData,
            BaseReferences<
              _$AppDatabase,
              $PreferencesTableTable,
              PreferencesTableData
            >,
          ),
          PreferencesTableData,
          PrefetchHooks Function()
        > {
  $$PreferencesTableTableTableManager(
    _$AppDatabase db,
    $PreferencesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PreferencesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PreferencesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PreferencesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<PreferenceType> preferenceType = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isSelected = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PreferencesTableCompanion(
                preferenceType: preferenceType,
                name: name,
                isSelected: isSelected,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required PreferenceType preferenceType,
                required String name,
                required bool isSelected,
                Value<int> rowid = const Value.absent(),
              }) => PreferencesTableCompanion.insert(
                preferenceType: preferenceType,
                name: name,
                isSelected: isSelected,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PreferencesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PreferencesTableTable,
      PreferencesTableData,
      $$PreferencesTableTableFilterComposer,
      $$PreferencesTableTableOrderingComposer,
      $$PreferencesTableTableAnnotationComposer,
      $$PreferencesTableTableCreateCompanionBuilder,
      $$PreferencesTableTableUpdateCompanionBuilder,
      (
        PreferencesTableData,
        BaseReferences<
          _$AppDatabase,
          $PreferencesTableTable,
          PreferencesTableData
        >,
      ),
      PreferencesTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PreferencesTableTableTableManager get preferencesTable =>
      $$PreferencesTableTableTableManager(_db, _db.preferencesTable);
}
