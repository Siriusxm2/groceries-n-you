import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function changeOffer;

  const ProductControl({Key? key, required this.changeOffer}) : super(key: key);

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
