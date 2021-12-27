import 'package:flutter/material.dart';
import 'search_items.dart';

class Categories extends StatefulWidget {
  static const String id = 'search_ads';

  @override
  _Categories createState() => _Categories();
}

class _Categories extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Text('CATEGORIES'),
    );
  }
}
