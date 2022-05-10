import 'package:flutter/material.dart';
import 'package:shop_app/homePage/product_manager.dart';
import 'package:shop_app/myWidgets/my_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: ProductManager(
        startingOffers: 'assets/Lasagna.png',
      ),
    );
  }
}
