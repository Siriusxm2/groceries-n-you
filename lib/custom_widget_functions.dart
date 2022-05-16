import 'package:flutter/material.dart';
import 'package:groceries_n_you/dimensions.dart';
import 'dart:math' as math;

class CustomWidgets {
  CustomWidgets._();

  static mySnackBarWidget(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xff333333),
        ),
      ),
      backgroundColor: const Color(0xffFFBE57),
      duration: const Duration(milliseconds: 2000),
      behavior: SnackBarBehavior.floating,
      width: Dimensions.width200,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color(0xff699BFF),
        ),
        borderRadius: BorderRadius.circular(Dimensions.border10),
      ),
    ));
  }

  static Future<bool> showErrorDialog(BuildContext context, String message) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Oops...'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    ).then((value) => value ?? false);
  }

  static List<Widget> promotion(
    bool isSale,
    num originalPrice,
    int saleAmount,
  ) {
    if (isSale) {
      final percentOff = originalPrice * saleAmount / 100;
      final result = originalPrice - percentOff;
      return [
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: Dimensions.font18,
              fontWeight: FontWeight.w900,
              color: const Color(0xff333333),
            ),
            children: [
              TextSpan(text: result.toStringAsFixed(2)),
              const TextSpan(text: ' лв.'),
            ],
          ),
        ),
        Stack(
          children: [
            Image.asset(
              'assets/saleTicket.png',
            ),
            Container(
              padding: EdgeInsets.only(left: Dimensions.width10),
              width: Dimensions.width40,
              height: Dimensions.font24,
              child: Align(
                child: Text(
                  '-$saleAmount%',
                  style: TextStyle(fontSize: Dimensions.font12),
                ),
              ),
            ),
          ],
        ),
      ];
    } else {
      return [
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: Dimensions.font18,
              fontWeight: FontWeight.w900,
              color: const Color(0xff333333),
            ),
            children: [
              TextSpan(text: originalPrice.toStringAsFixed(2)),
              const TextSpan(text: ' лв.'),
            ],
          ),
        ),
      ];
    }
  }

  static List<Widget> isPromotion({
    required bool isSale,
    required String picture,
    required String name,
    required String manufacturer,
    required num price,
    required int saleAmount,
  }) {
    if (isSale) {
      return [
        Container(
          height: Dimensions.height170,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.scaleDown,
              image: AssetImage(picture),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                children: List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    size: 16,
                    color: Color(0xff4382FF),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Image.asset('assets/cart.png'),
              ),
            ],
          ),
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: Dimensions.font13,
            color: const Color(0xff333333),
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: Dimensions.height5,
            bottom: Dimensions.height8,
          ),
          child: Text(
            manufacturer,
            style: TextStyle(
              fontSize: Dimensions.font12,
              fontWeight: FontWeight.w400,
              color: const Color(0xffcccccc),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: CustomWidgets.promotion(isSale, price, saleAmount),
        ),
        Stack(
          children: [
            SizedBox(
              width: Dimensions.width60,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: Dimensions.font16,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xffCCCCCC),
                  ),
                  children: [
                    TextSpan(text: price.toStringAsFixed(2)),
                    const TextSpan(text: ' лв.'),
                  ],
                ),
              ),
            ),
            Positioned(
              top: Dimensions.height8,
              child: Transform.rotate(
                angle: -35 * math.pi / 180,
                child: Container(
                  color: const Color(0xffCCCCCC),
                  width: Dimensions.width40,
                  height: Dimensions.height3,
                ),
              ),
            ),
          ],
        ),
      ];
    } else {
      return [
        Container(
          height: Dimensions.height170,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.scaleDown,
              image: AssetImage(picture),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                children: List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    size: 16,
                    color: Color(0xff4382FF),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Image.asset('assets/cart.png'),
              ),
            ],
          ),
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: Dimensions.font13,
            color: const Color(0xff333333),
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: Dimensions.height5,
            bottom: Dimensions.height8,
          ),
          child: Text(
            manufacturer,
            style: TextStyle(
              fontSize: Dimensions.font12,
              fontWeight: FontWeight.w400,
              color: const Color(0xffcccccc),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: CustomWidgets.promotion(isSale, price, saleAmount),
        ),
      ];
    }
  }
}
