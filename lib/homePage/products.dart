import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> offers;

  const Products([Key? key, this.offers = const []]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: offers
          .map(
            (element) => Card(
              child: Column(
                children: [
                  Image.asset(element),
                  const Text('Offer 1'),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
