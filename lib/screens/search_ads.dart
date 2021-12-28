import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marketplace/constants.dart';
import 'package:marketplace/models/category.dart';
import 'package:marketplace/screens/categories.dart';
import 'create_add.dart';
import 'items.dart';
import 'nav_bar.dart';
import 'search_by_keyword.dart';

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
      body: Items(),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(20),
      //         child: SearchByKeyword(),
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         // crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           // Expanded(
      //           //   flex: 1,
      //           //   child: Categories(),
      //           // ),
      //           // SizedBox(width: 20),
      //           Expanded(
      //             flex: 3,
      //             child: Items(),
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
