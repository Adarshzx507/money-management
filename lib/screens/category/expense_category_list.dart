import 'package:flutter/material.dart';
import 'package:project_1/db/category/category_db.dart';
import 'package:project_1/models/category/category_model.dart';

class Expensecategory extends StatelessWidget {
  const Expensecategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().expensecategortlistlistener,
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
