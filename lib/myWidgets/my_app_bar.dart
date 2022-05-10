import 'package:flutter/material.dart';

import '../profile/profile_login.dart';
import '../landing_page.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50,
      titleSpacing: 0.0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 30.0,
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                iconSize: 30.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileLogin(),
                    ),
                  );
                },
                icon: const Icon(Icons.person_outline),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LandingPage(),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),
        ],
      ),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          iconSize: 30.0,
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          iconSize: 28.0,
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
