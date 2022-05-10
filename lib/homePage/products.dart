import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> offers;

  Products([this.offers = const []]);

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
