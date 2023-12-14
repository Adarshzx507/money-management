import 'package:flutter/material.dart';
import 'package:project_1/screens/Add_transactions/Screen%20add%20transaction.dart';
import 'package:project_1/screens/category/category_add_popup.dart';
import 'package:project_1/screens/category/screen_category.dart';
import 'package:project_1/screens/home/widgets/bottom_navigation.dart';
import 'package:project_1/screens/transactions/screen_transaction.dart';

class Screenhome extends StatelessWidget {
  Screenhome({super.key});

  static ValueNotifier<int> selectedindexnotifier = ValueNotifier(0);

  final pages = const [
    screentransactions(),
    screencategory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('MONEY MANAGER'),
        centerTitle: true,
      ),
      bottomNavigationBar: const Bottom_navigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedindexnotifier,
          builder: (BuildContext context, int updatedindex, _) {
            return pages[updatedindex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedindexnotifier.value == 0) {
            print('transaction');
            Navigator.of(context).pushNamed(ScreenAddTransaction.routeName);
          } else {
            print('category');
            ShowCategoryAddPopup(context);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
