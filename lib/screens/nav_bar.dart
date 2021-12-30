import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'create_add.dart';

class NavBar extends StatefulWidget with PreferredSizeWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  _NavBar createState() => _NavBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavBar extends State<NavBar> {
  final int _cartItems = 0;
  int wishlist = 0;
  int messages = 0;

  bool get isHandset {
    return (!kIsWeb) || MediaQuery.of(context).size.width < 700;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kEpamBlack,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      title: const Text(
        'MARKET PLACE',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: isHandset
          ? [
              addButton(context),
            ]
          : [
              user(),
              cart(),
              wishlistButton(),
              messagesButton(),
              addButton(context),
            ],
    );
  }

  MaterialButton addButton(BuildContext context) {
    return MaterialButton(
      minWidth: 200,
      height: 60,
      color: kEpamBlue,
      child: const Text(
        '+CREATE ADD',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, CreateAdd.id);
      },
    );
  }

  MaterialButton messagesButton() {
    return MaterialButton(
      onPressed: () {},
      child: Row(
        children: [
          const Icon(
            Icons.email_outlined,
            color: Colors.white,
            semanticLabel: 'messages',
          ),
          Text(
            '$messages',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  MaterialButton wishlistButton() {
    return MaterialButton(
      onPressed: () {},
      child: Row(
        children: [
          const Icon(
            Icons.bookmark_border,
            color: Colors.white,
            semanticLabel: 'wishlist',
          ),
          Text(
            '$wishlist',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  MaterialButton cart() {
    return MaterialButton(
      onPressed: () {},
      child: Row(
        children: [
          const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            semanticLabel: 'cart',
          ),
          Text(
            '$_cartItems',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  MaterialButton user() {
    return MaterialButton(
      child: Row(
        children: const [
          Icon(
            Icons.account_circle,
            color: Colors.white,
            semanticLabel: 'USER',
          ),
          Text(
            'User',
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
      onPressed: () {},
    );
  }

  Size get preferredSize => const Size.fromHeight(50);
}
