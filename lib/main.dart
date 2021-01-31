import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myshirt/model/item.dart';
import 'package:myshirt/page/dashboard_page.dart';
import 'package:myshirt/provider/item_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider(
          create: (context) => ItemProvider.fetchAll(),
          initialData: List<Item>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: DashboardPage(),
      ),
    );
  }
}
