import 'package:flutter/material.dart';
import 'package:groceries_n_you/models/admin_product_model.dart';
import 'package:groceries_n_you/models/product_model.dart';

import '../../dimensions.dart';
import '../../myWidgets/widgets.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarHeader(label: 'All Products'),
      drawer: const MyDrawer(),
      bottomNavigationBar: const MyBottomNavbar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ProductModelAdmin.products.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 220,
                  child: ProductCard(
                    product: ProductModelAdmin.products[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModelAdmin product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.manu,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset(
                    product.picture,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            const Text('Sale'),
                            Checkbox(
                              value: product.isOnSale,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Row(
                          children: [
                            const Text('Sale Amount'),
                            const SizedBox(width: 10),
                            SizedBox(
                              height: 20,
                              width: 25,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                initialValue: product.saleAmount.toString(),
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Text('Price'),
                            const SizedBox(width: 10),
                            SizedBox(
                              height: 20,
                              width: 40,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                initialValue: product.price.toString(),
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Row(
                          children: [
                            const Text('In Storage'),
                            const SizedBox(width: 10),
                            SizedBox(
                              height: 20,
                              width: 25,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                initialValue: product.inStorage.toString(),
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
