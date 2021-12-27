import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';

class SearchItems extends StatelessWidget {
  bool hintActive = true;

  SearchItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: TextField(
          onChanged: (value) {
            hintActive = false;
            // print(value);
          },
          decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              color: kEpamBlue,
            ),
            hintText: hintActive
                ? 'search for an item, for example dinning table'
                : "",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: kEpamBlue,
              ),
            ),
            border: OutlineInputBorder(),
          ),
        ));
  }
}