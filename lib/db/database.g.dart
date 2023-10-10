// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GroupmatesTable extends Groupmates
    with TableInfo<$GroupmatesTable, Groupmate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupmatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 70),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdTimeMeta =
      const VerificationMeta('createdTime');
  @override
  late final GeneratedColumn<String> createdTime = GeneratedColumn<String>(
      'created_time', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 60),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, fullName, createdTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'groupmates';
  @override
  VerificationContext validateIntegrity(Insertable<Groupmate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('created_time')) {
      context.handle(
          _createdTimeMeta,
          createdTime.isAcceptableOrUnknown(
              data['created_time']!, _createdTimeMeta));
    } else if (isInserting) {
      context.missing(_createdTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Groupmate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Groupmate(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      createdTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_time'])!,
    );
  }

  @override
  $GroupmatesTable createAlias(String alias) {
    return $GroupmatesTable(attachedDatabase, alias);
  }
}

class Groupmate extends DataClass implements Insertable<Groupmate> {
  final int id;
  final String fullName;
  final String createdTime;
  const Groupmate(
      {required this.id, required this.fullName, required this.createdTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    map['created_time'] = Variable<String>(createdTime);
    return map;
  }

  GroupmatesCompanion toCompanion(bool nullToAbsent) {
    return GroupmatesCompanion(
      id: Value(id),
      fullName: Value(fullName),
      createdTime: Value(createdTime),
    );
  }

  factory Groupmate.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Groupmate(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      createdTime: serializer.fromJson<String>(json['createdTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'createdTime': serializer.toJson<String>(createdTime),
    };
  }

  Groupmate copyWith({int? id, String? fullName, String? createdTime}) =>
      Groupmate(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        createdTime: createdTime ?? this.createdTime,
      );
  @override
  String toString() {
    return (StringBuffer('Groupmate(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('createdTime: $createdTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fullName, createdTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Groupmate &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.createdTime == this.createdTime);
}

class GroupmatesCompanion extends UpdateCompanion<Groupmate> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<String> createdTime;
  const GroupmatesCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.createdTime = const Value.absent(),
  });
  GroupmatesCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required String createdTime,
  })  : fullName = Value(fullName),
        createdTime = Value(createdTime);
  static Insertable<Groupmate> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? createdTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (createdTime != null) 'created_time': createdTime,
    });
  }

  GroupmatesCompanion copyWith(
      {Value<int>? id, Value<String>? fullName, Value<String>? createdTime}) {
    return GroupmatesCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (createdTime.present) {
      map['created_time'] = Variable<String>(createdTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupmatesCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('createdTime: $createdTime')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $GroupmatesTable groupmates = $GroupmatesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [groupmates];
}
