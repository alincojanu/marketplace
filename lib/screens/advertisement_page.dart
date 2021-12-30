import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:marketplace/models/advertisement.dart';

import '../constants.dart';
import 'nav_bar.dart';

class AdvertisementPage extends StatefulWidget {
  static const String id = 'advertisement_page';
  int? itemId;

  AdvertisementPage({Key? key, this.itemId}) : super(key: key);

  @override
  _AdvertisementPage createState() => _AdvertisementPage(this.itemId);
}

class _AdvertisementPage extends State<AdvertisementPage> {
  int? itemId;

  _AdvertisementPage(this.itemId);

  var client = http.Client();
  Advertisement? advertisement;

  @override
  void initState() {
    super.initState();
    getItem();
  }

  Future<void> getItem() async {
    final response =
        await client.get(Uri.parse('$kUrl/api/advertisements/$itemId'));
    if (response.statusCode == 200) {
      setState(() {
        advertisement = Advertisement.fromJson(jsonDecode(response.body));
      });
    } else {
      throw Exception('Failed to load categories');
    }
  }

  bool get isHandset {
    return (!kIsWeb) || MediaQuery.of(context).size.width < 700;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar(),
      body: Center(
        child: advertisement == null
            ? const SpinKitRotatingCircle(
                color: Colors.blue,
                size: 50.0,
              )
            : isHandset
                ? smallView(context)
                : bigView(context),
      ),
    );
  }

  Row bigView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildImage(context),
        buildCard(context, advertisement),
      ],
    );
  }

  Column smallView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildImage(context),
        buildCard(context, advertisement),
      ],
    );
  }
}

Widget buildImage(BuildContext context) {
  return const Image(
    width: 250,
    height: 250,
    image: NetworkImage(
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
  );
}

Widget buildCard(BuildContext context, Advertisement? advertisement) {
  return SizedBox(
    width: 300,
    height: 300,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item ${advertisement!.title}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          advertisement.description,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'CHF ${advertisement.price}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text('PICKUP FOR FREE: ${advertisement.location}'),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => kEpamBlue),
          ),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'CONTACT SELLER',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
