import 'package:flutter/material.dart';
import 'package:marketplace/constants.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 70,
              vertical: 60,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SearchItems(),
                SizedBox(height: 24),
                Row(
                  children: [
                    Text('Categories'),
                    SizedBox(width: 250),
                    Text('Items'),
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

