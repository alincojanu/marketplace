import 'package:flutter/material.dart';
import 'screens/search_ads.dart';
import 'screens/create_add.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace',
      debugShowCheckedModeBanner: false,
      initialRoute: SearchAds.id,
      routes: {
        '/': (context) => SearchAds(),
        CreateAdd.id: (context) => CreateAdd(),
      },
    );
  }
}
