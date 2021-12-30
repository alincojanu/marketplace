import 'package:flutter/material.dart';
import 'package:marketplace/models/advertisement.dart';
import 'package:marketplace/widgets/advertisement_card.dart';

class AdvertisementItems extends StatelessWidget {
  List<Advertisement> items = [];
  bool smallScreen;

  AdvertisementItems({Key? key, required this.items, required this.smallScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Advertisement defaultAd = Advertisement(
        title: '',
        location: '',
        price: 0,
        description: '',
        image: '',
        owner: '');

    return smallScreen ? cardList(defaultAd) : gridViw(defaultAd);
  }

  Widget gridViw(Advertisement defaultAd) {
    return GridView.count(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 4,
      children: buildAdvertisementCards(defaultAd),
    );
  }

  Widget cardList(Advertisement defaultAd) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Column(
          children: buildAdvertisementCards(defaultAd),
        ),
      ),
    );
  }

  List<AdvertisementCard> buildAdvertisementCards(Advertisement defaultAd) {
    return items.isEmpty
        ? List<AdvertisementCard>.filled(
            1, AdvertisementCard(advertisement: defaultAd))
        : items.map((e) => AdvertisementCard(advertisement: e)).toList();
  }
}
