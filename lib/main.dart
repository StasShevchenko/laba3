import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:laba3/db/database.dart';
import 'package:laba3/db/db_provider.dart';
import 'package:laba3/pages/groupmates_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = DatabaseProvider.get();
  await database.groupmates.deleteAll();
  await database.into(database.groupmates).insert(GroupmatesCompanion.insert(
      fullName: 'Станислав Шевченко', createdTime: DateTime.now().toString()));
  await database.into(database.groupmates).insert(GroupmatesCompanion.insert(
      fullName: 'Евгений Сендецкий', createdTime: DateTime.now().toString()));
  await database.into(database.groupmates).insert(GroupmatesCompanion.insert(
      fullName: 'Михаил Шаульский', createdTime: DateTime.now().toString()));
  await database.into(database.groupmates).insert(GroupmatesCompanion.insert(
      fullName: 'Григорий Боярский', createdTime: DateTime.now().toString()));
  await database.into(database.groupmates).insert(GroupmatesCompanion.insert(
      fullName: 'Елена Круг', createdTime: DateTime.now().toString()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Главный экран'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GroupmatesList()));
                  },
                  child: const Text('Одногруппники')),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final database = DatabaseProvider.get();
                    await database.into(database.groupmates).insert(
                        GroupmatesCompanion.insert(
                            fullName: 'Евгения Агафонова',
                            createdTime: DateTime.now().toString()));
                  }, child: const Text('Добавить одногруппника')),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final database = DatabaseProvider.get();
                    final groupmates = await database.groupmates.select().get();
                    Groupmate groupmate = groupmates[0];
                    for (var gr in groupmates) {
                      if (gr.createdTime.compareTo(groupmate.createdTime) > 0) {
                        groupmate = gr;
                      }
                    }
                    (database.update(database.groupmates)..where((tbl) =>
                        tbl.id.isValue(groupmate.id))
                    ).write(GroupmatesCompanion.insert(
                      fullName: 'Иванов Иван Иванович',
                        createdTime: DateTime.now().toString()
                    ));
                  },
                  child: const Text('Заменить последнюю запись'))
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
