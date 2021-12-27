import 'package:flutter/material.dart';

import '../constants.dart';
import 'create_add.dart';

class NavBar extends StatelessWidget with PreferredSizeWidget {
  int _cartItems = 0;
  int wishlist = 0;
  int messages = 0;

  NavBar({Key? key}) : super(key: key);

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
      actions: [
        MaterialButton(
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
        ),
        MaterialButton(
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
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        MaterialButton(
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
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        MaterialButton(
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
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        MaterialButton(
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
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
