import 'package:flutter/material.dart';
import 'package:laba3/db/db_provider.dart';
import 'package:laba3/pages/groupmate_item.dart';
import 'package:laba3/db/database.dart';


class GroupmatesList extends StatefulWidget {
  const GroupmatesList({super.key});

  @override
  State<GroupmatesList> createState() => _GroupmatesListState();
}

class _GroupmatesListState extends State<GroupmatesList> {
  List<Groupmate> groupmates = [];

  @override
  void initState() {
    super.initState();
    _loadGroupmates();
  }

  Future<void> _loadGroupmates() async {
    final database = DatabaseProvider.get();
    final loadedGroupmates = await database.select(database.groupmates).get();
    setState(() {
      groupmates = loadedGroupmates;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Одногруппники'), centerTitle: true,),
      body: Center(
          child: ListView.builder(
              itemCount: groupmates.length,
              itemBuilder: (context, index) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GroupmateItem(groupmate: groupmates[index]),
                  ))
      ),
    );
  }
}
