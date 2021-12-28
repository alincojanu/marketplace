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
          Expanded(
            child: Image(
              height: 100.0,
              fit: BoxFit.cover,
              image: NetworkImage(advertisement.imageUrl),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              advertisement.title.toString().toUpperCase(),
              style: TextStyle(
                color: kEpamBlack,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(advertisement.description),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(advertisement.price),
                ),
                Container(
                  child: Text(advertisement.location),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
