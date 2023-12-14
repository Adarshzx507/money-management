import 'package:flutter/material.dart';
import 'package:project_1/models/category/category_model.dart';

class ScreenAddTransaction extends StatelessWidget {
  static const routeName = 'add transaction';
  const ScreenAddTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Purpose',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.calendar_today),
              label: const Text('Select date'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: CategoryType.income,
                      onChanged: (newvalue) {},
                    ),
                    const Text('Income')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: CategoryType.expense,
                      onChanged: (newvalue) {},
                    ),
                    const Text('Expense')
                  ],
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
