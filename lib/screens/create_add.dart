import 'package:flutter/material.dart';
import 'package:marketplace/screens/nav_bar.dart';

class CreateAdd extends StatefulWidget {
  static const String id = 'create_add';

  @override
  _CreateAdd createState() => _CreateAdd();
}

class _CreateAdd extends State<CreateAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar(),
      body: Text('add item form'),
    );
  }
}
