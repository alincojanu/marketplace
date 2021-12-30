import 'package:flutter/material.dart';
import 'package:marketplace/models/advertisement.dart';
import 'package:marketplace/screens/advertisement_page.dart';

import '../constants.dart';

class AdvertisementCard extends StatelessWidget {
  Advertisement advertisement;

  AdvertisementCard({Key? key, required this.advertisement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 300,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdvertisementPage(itemId: advertisement.id),
              ));
        },
        child: Card(
          child: Column(
            children: [
              const Expanded(
                child: Image(
                  height: 100.0,
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
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
                    Text('CHF ${advertisement.price}'),
                    Text(
                      advertisement.location,
                      style: TextStyle(color: kEpamBlack),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
