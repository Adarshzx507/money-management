import 'package:flutter/material.dart';
import 'package:project_1/screens/home/Screenhome.dart';

class Bottom_navigation extends StatelessWidget {
  const Bottom_navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Screenhome.selectedindexnotifier,
      builder: (BuildContext context, int updatedindex, Widget? _) {
        return BottomNavigationBar(
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.grey,
            currentIndex: updatedindex,
            onTap: (newindex) {
              Screenhome.selectedindexnotifier.value = newindex;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Transaction',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Category',
              ),
            ]);
      },
    );
  }
}
