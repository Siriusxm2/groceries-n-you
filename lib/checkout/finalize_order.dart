import 'package:flutter/material.dart';
import 'package:groceries_n_you/constants/order_info.dart';
import 'package:groceries_n_you/constants/prices.dart';
import 'package:groceries_n_you/dimensions.dart';

import '../myWidgets/widgets.dart';

class FinalizePage extends StatelessWidget {
  const FinalizePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Column(
        children: [
          const MyHeaderWidget(text: 'Finalize'),
          Column(
            children: [
              // delivery info
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: Dimensions.height10),
                      child: Center(
                        child: Text(
                          'Delivery Information',
                          style: TextStyle(
                            fontSize: Dimensions.font16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    _customRow(context, 'Name:', orderInfoName),
                    _customRow(context, 'Email:', orderInfoEmail),
                    _customRow(context, 'Address:', orderInfoAddress),
                    _customRow(context, 'Phone:', orderInfoPhone),
                    _customRow(
                        context, 'Delivery Date:', orderInfoDeliveryDate),
                    _customRow(
                        context, 'Delivery Hour:', orderInfoDeliveryHour),
                    _customRow(context, 'Payment Method:', orderInfoPayment),
                  ],
                ),
              ),
              const Divider(
                indent: 10,
                endIndent: 10,
                height: 1,
                thickness: 1,
                color: Color(0xffcccccc),
              ),
              // cart info
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: Dimensions.height10),
                      child: Center(
                        child: Text(
                          'Cart',
                          style: TextStyle(
                            fontSize: Dimensions.font16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    _customRow(context, 'Subtotal:',
                        '${pricesSubTotal.toStringAsFixed(2)} лв.'),
                    _customRow(context, 'Delivery Fee:',
                        '${pricesDeliveryFee.toStringAsFixed(2)} лв.'),
                    _customRow(context, 'Voucher:',
                        '-${pricesVoucher.toStringAsFixed(2)} лв.'),
                    _customRow(context, 'Total:',
                        '${pricesTotal.toStringAsFixed(2)} лв.'),
                  ],
                ),
              ),
              // order button
              Container(
                width: Dimensions.width320 / 2,
                height: Dimensions.height30,
                margin: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height20,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //   checkoutRoute,
                    //   (route) => true,
                    // );
                  },
                  child: const Center(
                    child: Text(
                      'Order',
                      style: TextStyle(
                        color: Color(0xff333333),
                      ),
                    ),
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
        ],
      ),
      drawer: const MyDrawer(),
      floatingActionButton: const MyFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: const MyBottomNavbar(),
    );
  }
}

Padding _customRow(BuildContext context, String label, String content) {
  return Padding(
    padding: EdgeInsets.only(bottom: Dimensions.height5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: Dimensions.font16),
        ),
        Text(
          content,
          style: TextStyle(fontSize: Dimensions.font16),
        ),
      ],
    ),
  );
}
