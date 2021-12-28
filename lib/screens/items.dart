import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/constants.dart';
import 'package:marketplace/models/advertisement.dart';
import 'package:marketplace/widgets/advertisement_card.dart';

class Items extends StatefulWidget {
  @override
  _Items createState() => _Items();
}

class _Items extends State<Items> {
  List<Advertisement> items = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children:
          getItems().map((e) => AdvertisementCard(advertisement: e)).toList(),
    );
  }

  List<Advertisement> getItems() {
    items.add(Advertisement(
        title: 'Apple',
        description: 'Very good condition, 15.2 display, 1.67 GHz',
        price: 'CHF 50',
        imageUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        location: '8045, Zurich'));
    items.add(Advertisement(
        title: 'Apple',
        description: 'Very good condition, 15.2 display, 1.67 GHz',
        price: 'CHF 50',
        imageUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        // Image.asset('icons8-menu-24.png'),
        location: '8045, Zurich'));
    items.add(Advertisement(
        title: 'Apple',
        description: 'Very good condition, 15.2 display, 1.67 GHz',
        price: 'CHF 50',
        imageUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        // Image.asset('icons8-menu-24.png'),
        location: '8045, Zurich'));
    items.add(Advertisement(
        title: 'Apple',
        description: 'Very good condition, 15.2 display, 1.67 GHz',
        price: 'CHF 50',
        imageUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        // Image.asset('icons8-menu-24.png'),
        location: '8045, Zurich'));
    return items;
  }
}
