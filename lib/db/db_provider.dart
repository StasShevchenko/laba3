import 'database.dart';

class DatabaseProvider{
  static AppDatabase? instance;
  final database = AppDatabase();

  static AppDatabase get(){
    instance ??= AppDatabase();
    return instance!;
  }
}