import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketplace/models/advertisement.dart';
import 'package:marketplace/models/advertisement_request.dart';
import 'package:marketplace/models/category.dart';
import 'package:marketplace/screens/categories.dart';

import '../constants.dart';
import 'advertisement_items.dart';
import 'nav_bar.dart';
import 'search_by_keyword.dart';

class SearchAds extends StatefulWidget {
  static const String id = 'search_ads';

  const SearchAds({Key? key}) : super(key: key);

  @override
  _SearchAds createState() => _SearchAds();
}

class _SearchAds extends State<SearchAds> {
  List<Advertisement> items = [];
  List<Category> categories = [];

  var client = http.Client();

  @override
  void initState() {
    super.initState();
    getAdvertisements();
    getCategories();
  }

  Future<void> getAdvertisements() async {
    final response = await client.post(
        Uri.parse('$kUrl/api/search/advertisements'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(AdvertisementRequest(pageNumber: 0, pageSize: 10)));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        items = data['items']
            .map<Advertisement>((model) => Advertisement.fromJson(model))
            .toList();
      });
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<void> getCategories() async {
    final response = await client.get(Uri.parse('$kUrl/api/categories'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      setState(() {
        categories.addAll(
            parsed.map<Category>((json) => Category.fromJson(json)).toList());
      });
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: SearchByKeyword(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 400,
                  child: Categories(
                    categories: categories,
                    key: ValueKey(categories),
                  ),
                ),
                SizedBox(
                  width: 800,
                  height: 500,
                  child: AdvertisementItems(
                    items: items,
                    key: ValueKey(items),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
