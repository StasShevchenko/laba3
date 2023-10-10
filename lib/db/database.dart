import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Groupmates extends Table {

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 30)();

  TextColumn get lastName => text().withLength(min: 1, max: 30)();

  TextColumn get surname => text().withLength(min: 1, max: 30)();

  TextColumn get createdTime => text().withLength(min: 1, max: 60)();

  @override
  String get tableName {
    return "groupmates";
  }
}

@DriftDatabase(tables: [Groupmates])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (Migrator m) async {
      await m.createAll();
    }, onUpgrade: (Migrator m, int from, int to) async {
      if (to == 2) {
        await m.deleteTable("groupmates");
        await m.createTable(groupmates);
      }
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
