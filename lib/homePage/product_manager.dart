import 'package:flutter/material.dart';
import 'dart:math';

import 'products.dart';
import 'product_control.dart';

class ProductManager extends StatefulWidget {
  final String startingOffers;

  const ProductManager({Key? key, this.startingOffers = ''}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  final List<String> _offers = [];
  final List<String> _pics = [
    'assets/Deal1.png',
    'assets/Deal2.png',
    'assets/Deal3.png'
  ];

  @override
  void initState() {
    _offers.add(widget.startingOffers);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ProductManager oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _updateOffers() {
    setState(() {
      final _random = Random();
      _offers.remove(_offers.last);
      _offers.add(_pics[_random.nextInt(_pics.length)]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: ProductControl(changeOffer: _updateOffers),
        ),
        Products(null, _offers),
      ],
    );
  }
}
