import 'package:flutter/material.dart';

import '../../myWidgets/widgets.dart';

class NewProductPage extends StatelessWidget {
  const NewProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarHeader(label: 'Add new product'),
      drawer: const MyDrawer(),
      bottomNavigationBar: const MyBottomNavbar(),
      body: Column(),
    );
  }
}
