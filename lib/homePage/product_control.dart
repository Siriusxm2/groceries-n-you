import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function changeOffer;

  ProductControl(this.changeOffer);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        changeOffer();
      },
      child: const Text('Switch Product'),
    );
  }
}
