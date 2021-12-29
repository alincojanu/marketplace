import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marketplace/constants.dart';
import 'package:marketplace/models/advertisement.dart';
import 'package:marketplace/models/advertisement_request.dart';
import 'package:marketplace/models/category.dart';
import 'package:marketplace/screens/categories.dart';
import 'create_add.dart';
import 'advertisement_items.dart';
import 'nav_bar.dart';
import 'search_by_keyword.dart';
import 'package:http/http.dart' as http;

class SearchAds extends StatefulWidget {
  static const String id = 'search_ads';

  const SearchAds({Key? key}) : super(key: key);

  @override
  _SearchAds createState() => _SearchAds();
}

class _SearchAds extends State<SearchAds> {
  List<Advertisement> items = [];

  final String url =
      'https://marketplace-be-epm-marketplace.apps.cluster6.eu.aws.cloudapp.epam.com/';
  var client = http.Client();

  @override
  void initState() {
    super.initState();
    getAdvertisements();
  }

  Future<void> getAdvertisements() async {
    final response = await client.post(
        Uri.parse('$url/api/search/advertisements'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(AdvertisementRequest(pageNumber: 0, pageSize: 10)));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        items = data['items'].map<Advertisement>((model) => Advertisement.fromJson(model)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar(),
      body: AdvertisementItems(items: items, key: ValueKey(items)),
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
