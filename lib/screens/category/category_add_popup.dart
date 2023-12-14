import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_1/db/category/category_db.dart';
import 'package:project_1/models/category/category_model.dart';

ValueNotifier<CategoryType> SelectedCategoryNotifier =
    ValueNotifier(CategoryType.income);

Future<void> ShowCategoryAddPopup(BuildContext context) async {
  final nameEditingController = TextEditingController();
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: const Text('Add category'),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameEditingController,
                decoration: const InputDecoration(
                  hintText: 'Category name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  RadioButton(title: 'Income', type: CategoryType.income),
                  RadioButton(title: 'Expense', type: CategoryType.expense),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    final name = nameEditingController.text;
                    if (name.isEmpty) {
                      return;
                    }
                    final _type = SelectedCategoryNotifier.value;

                    print(name);
                    print(_type);

                    final category = CategoryModel(
                        name: name,
                        type: _type,
                        id: DateTime.now().microsecondsSinceEpoch.toString());

                    CategoryDB.instance.insertCategory(category);
                    Navigator.of(ctx).pop();
                  },
                  child: Text('Add')),
            )
          ],
        );
      });
}

class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;
  const RadioButton({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: SelectedCategoryNotifier,
            builder: (BuildContext ctx, CategoryType newcategory, Widget? _) {
              return Radio<CategoryType>(
                  value: type,
                  groupValue: newcategory,
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    SelectedCategoryNotifier.value = value;
                    SelectedCategoryNotifier.notifyListeners();
                  });
            }),
        Text(title),
      ],
    );
  }
}
