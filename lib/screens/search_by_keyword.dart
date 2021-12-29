import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';

class SearchByKeyword extends StatelessWidget {
  bool hintActive = true;

  SearchByKeyword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: TextField(
          onChanged: (value) {
            hintActive = false;
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
            border: const OutlineInputBorder(),
          ),
        ));
  }
}
