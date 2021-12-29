import 'package:flutter/material.dart';
import 'package:marketplace/models/advertisement.dart';

import '../constants.dart';

class AdvertisementCard extends StatelessWidget {
  Advertisement advertisement;

  AdvertisementCard({Key? key, required this.advertisement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Expanded(
            child: Image(
              height: 100.0,
              fit: BoxFit.cover,
              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              advertisement.title.toString().toUpperCase(),
              style: TextStyle(
                color: kEpamBlack,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(advertisement.description),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(advertisement.price.toString()),
                Text(advertisement.location),
              ],
            ),
          )
        ],
      ),
    );
  }
}
