import 'package:flutter/material.dart';
import 'package:marketplace/constants.dart';
import 'package:marketplace/models/category.dart';
import 'package:marketplace/screens/categories.dart';
import 'create_add.dart';
import 'nav_bar.dart';
import 'search_items.dart';

class SearchAds extends StatefulWidget {
  static const String id = 'search_ads';

  @override
  _SearchAds createState() => _SearchAds();
}

class _SearchAds extends State<SearchAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar(),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: SearchItems(),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Categories(),
                    ),
                    // SizedBox(width: 25),
                    Expanded(
                      flex: 3,
                      child: Text('Items'),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
