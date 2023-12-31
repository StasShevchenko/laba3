import 'package:flutter/material.dart';

import '../db/database.dart';

class GroupmateItem extends StatelessWidget {
  final Groupmate groupmate;

  const GroupmateItem({super.key, required this.groupmate});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Имя: ${groupmate.name}'),
            SizedBox(
              height: 8,
            ),
            Text('Фамилия: ${groupmate.lastName}'),
            SizedBox(
              height: 8,
            ),
            Text('Отчество: ${groupmate.surname}'),
            SizedBox(
              height: 16,
            ),
            Text('Время создания: ${groupmate.createdTime}')
          ],
        ),
      ),
    );
  }
}
