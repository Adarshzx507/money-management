import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_1/db/category/category_db.dart';
import 'package:project_1/models/category/category_model.dart';
import 'package:project_1/screens/Add_transactions/Screen%20add%20transaction.dart';
import 'package:project_1/screens/home/Screenhome.dart';

const Savekeyname = 'userloggedin';

Future<void> main() async {
  //this is money  managemnt applciations
  print("hello world");
  final obj1 = CategoryDB();
  final obj2 = CategoryDB();

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
  } else {
    Hive.registerAdapter(CategoryTypeAdapter());
  }

  if (Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
  } else {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      home: Screenhome(),
      routes: {
        ScreenAddTransaction.routeName: (ctx) => const ScreenAddTransaction(),
      },
    );
  }
}
