import 'package:flutter/material.dart';
import 'package:groceries_n_you/constants/routes.dart';
import 'package:groceries_n_you/dimensions.dart';
//import 'dart:developer' as devtools show log;

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: Dimensions.height50,
      titleSpacing: 0.0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 30.0,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                iconSize: 30.0,
                onPressed: () {
                  if (ModalRoute.of(context)!.settings.name != profileRoute) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(profileRoute, (route) => true);
                  }
                },
                icon: const Icon(Icons.person_outline),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  if (ModalRoute.of(context)!.settings.name != initialRoute) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(initialRoute, (_) => false);
                  }
                },
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                  width: Dimensions.width40,
                  height: Dimensions.height40,
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
          onPressed: () {
            if (ModalRoute.of(context)!.settings.name != cartRoute) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(cartRoute, (route) => true);
            }
          },
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
