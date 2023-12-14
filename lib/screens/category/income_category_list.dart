import 'package:flutter/material.dart';

import '../../db/category/category_db.dart';
import '../../models/category/category_model.dart';

class Incomecategorylist extends StatelessWidget {
  const Incomecategorylist({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().incomecategorylistlistener,
      builder: (BuildContext ctx, List<CategoryModel> newlist, Widget? _) {
        return ListView.separated(
            itemBuilder: (ctx, index) {
              final category = newlist[index];
              return Card(
                child: ListTile(
                    title: Text(category.name),
                    trailing: IconButton(
                        onPressed: () {
                          CategoryDB.instance.deletecategory(category.id);
                        },
                        icon: const Icon(Icons.delete))),
              );
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(height: 5);
            },
            itemCount: newlist.length);
      },
    );
  }
}
