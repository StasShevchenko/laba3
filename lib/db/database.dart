import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Groupmates extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get fullName => text().withLength(min: 1, max: 70)();

  TextColumn get createdTime => text().withLength(min: 1, max: 60)();
}

@DriftDatabase(tables: [Groupmates])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
