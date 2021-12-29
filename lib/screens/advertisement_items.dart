import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/models/advertisement.dart';
import 'package:marketplace/widgets/advertisement_card.dart';

class AdvertisementItems extends StatelessWidget {
  List<Advertisement> items = [];

  AdvertisementItems({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: items.map((e) => AdvertisementCard(advertisement: e)).toList(),
    );
  }
}
