import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_n_you/dimensions.dart';
import 'package:groceries_n_you/models/cart_model.dart';
import 'package:groceries_n_you/models/product_model.dart';
import 'package:groceries_n_you/myWidgets/my_app_bar.dart';
import 'package:groceries_n_you/myWidgets/my_bottom_navbar.dart';
import 'package:groceries_n_you/myWidgets/my_drawer.dart';
import 'package:groceries_n_you/myWidgets/my_floating_button.dart';
import 'package:groceries_n_you/myWidgets/my_header.dart';
import 'dart:math' as math;

import '../blocks/cart/cart_bloc.dart';
import 'cart_product_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late TextEditingController _voucher;
  late String voucher;

  @override
  void initState() {
    _voucher = TextEditingController();
    voucher = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CartLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const MyHeaderWidget(text: 'Your Cart'),
                // image
                Container(
                  margin: EdgeInsets.only(top: Dimensions.height20),
                  width: MediaQuery.of(context).size.width - Dimensions.width20,
                  height: Dimensions.height150 + Dimensions.height10,
                  child: Image.asset(
                    'assets/cart_add.png',
                    fit: BoxFit.fill,
                  ),
                ),
                // Product strip
                Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height10,
                  ),
                  width: MediaQuery.of(context).size.width - Dimensions.width20,
                  height: Dimensions.height50 / 2,
                  color: const Color(0xffB4CDFF),
                  alignment: Alignment.center,
                  child: Text(
                    'Products',
                    style: TextStyle(
                      color: const Color(0xff333333),
                      fontSize: Dimensions.font14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                // PRODUCT SHOWCASE
                SizedBox(
                  width: MediaQuery.of(context).size.width - Dimensions.width20,
                  child: LimitedBox(
                    maxHeight: Dimensions.height200 + Dimensions.height180,
                    child: ListView.builder(
                      itemCount: state.cart
                          .productQuantity(state.cart.products)
                          .keys
                          .length,
                      itemBuilder: (context, index) {
                        if (state.cart.products.isEmpty) {
                          return const Text(
                              'There are no products in the cart yet!');
                        } else {
                          return CartProduct(
                            product: state.cart
                                .productQuantity(state.cart.products)
                                .keys
                                .elementAt(index),
                            quantity: state.cart
                                .productQuantity(state.cart.products)
                                .values
                                .elementAt(index),
                          );
                        }
                      },
                    ),
                  ),
                ),
                // PRODUCT SHOWCASE END
                // divider
                Container(
                  margin: EdgeInsets.only(top: Dimensions.height10),
                  child: Divider(
                    thickness: 1,
                    indent: Dimensions.width10,
                    endIndent: Dimensions.width10,
                    color: const Color(0xffcccccc),
                  ),
                ),
                // voucher
                Container(
                  margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
                  width: MediaQuery.of(context).size.width - Dimensions.width20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: Dimensions.width5),
                            child: Text(
                              'Add voucher',
                              style: TextStyle(
                                fontSize: Dimensions.font14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: Dimensions.width5),
                            width: 20,
                            height: 20,
                            child: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.help_outline,
                                color: Color(0xff999999),
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.height10),
                        height: Dimensions.height50 / 2,
                        child: TextField(
                          controller: _voucher,
                          autocorrect: false,
                          decoration: InputDecoration(
                            suffix: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.border10),
                                    ),
                                  ),
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  fixedSize: Size(
                                    Dimensions.width50,
                                    Dimensions.height50 / 2,
                                  )),
                              onPressed: () {
                                setState(() {
                                  voucher = _voucher.text;
                                });
                              },
                              child: const Text('Add'),
                            ),
                            contentPadding: EdgeInsets.only(
                                left: Dimensions.width12,
                                right: Dimensions.width10 / 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(Dimensions.border10),
                              ),
                              borderSide: const BorderSide(
                                color: Color(0xffD4D4D4),
                              ),
                            ),
                            hintText: 'Enter voucher...',
                            hintStyle: const TextStyle(
                              color: Color(0xff959595),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // prices
                Container(
                  margin: EdgeInsets.only(top: Dimensions.height20),
                  width: MediaQuery.of(context).size.width - Dimensions.width30,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal:',
                            style: TextStyle(fontSize: Dimensions.font14),
                          ),
                          Text(
                            state.cart.subtotalString,
                            style: TextStyle(
                              fontSize: Dimensions.font14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Voucher:',
                            style: TextStyle(fontSize: Dimensions.font14),
                          ),
                          Text(
                            voucher == 'TEST10' ? '-10.00 лв.' : '-0.00 лв.',
                            style: TextStyle(
                              fontSize: Dimensions.font14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery:',
                            style: TextStyle(fontSize: Dimensions.font14),
                          ),
                          Text(
                            '5.00 лв.',
                            style: TextStyle(
                              fontSize: Dimensions.font14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // total strip
                Container(
                  width: MediaQuery.of(context).size.width - Dimensions.width20,
                  height: Dimensions.height50 / 2,
                  color: const Color(0xffFFCE81),
                  margin: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: Dimensions.width5),
                        child: Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: Dimensions.font14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: Dimensions.width5),
                        child: Text(
                          voucher == 'TEST10'
                              ? (state.cart.totalDouble - 10.00)
                                      .toStringAsFixed(2) +
                                  ' лв.'
                              : state.cart.totalDouble.toStringAsFixed(2) +
                                  ' лв.',
                          style: TextStyle(
                            fontSize: Dimensions.font14 +
                                (Dimensions.font14 / Dimensions.font14),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // finalize button
                Container(
                  width: Dimensions.width320 / 2,
                  height: Dimensions.height50 / 2,
                  margin: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //   profileOrdersRoute,
                      //   (route) => true,
                      // );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Center(
                          child: Text(
                            'Finalize',
                            style: TextStyle(
                              color: Color(0xff333333),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Transform.rotate(
                            angle: 90 * math.pi / 180,
                            child: const Icon(
                              Icons.expand_less,
                              color: Color(0xff666666),
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: const Color(0xff8EB4FF),
                      side: const BorderSide(
                        color: Color(0xffFFAE2D),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Text('Something went wrong!');
        }
      }),
      drawer: const MyDrawer(),
      floatingActionButton: const MyFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: const MyBottomNavbar(),
    );
  }
}
