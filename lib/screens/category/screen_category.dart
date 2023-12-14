import 'package:flutter/material.dart';
import 'package:project_1/db/category/category_db.dart';
import 'package:project_1/screens/category/expense_category_list.dart';
import 'package:project_1/screens/category/income_category_list.dart';

class screencategory extends StatefulWidget {
  const screencategory({super.key});

  @override
  State<screencategory> createState() => _screencategoryState();
}

class _screencategoryState extends State<screencategory>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CategoryDB().refershUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.pink,
          unselectedLabelColor: Colors.black,
          tabs: const [
            Tab(text: 'INCOME'),
            Tab(text: 'EXPENSE'),
          ],
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: const [
            Incomecategorylist(),
            Expensecategory(),
          ]),
        )
      ],
    );
  }
}
