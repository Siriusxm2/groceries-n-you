import 'package:flutter/material.dart';
import 'package:groceries_n_you/categories/product_controller.dart';
import 'package:groceries_n_you/custom_widget_functions.dart';
import 'package:groceries_n_you/dimensions.dart';

class MyProductWidget extends StatelessWidget {
  final String prodName;
  final String prodManu;
  final String prodPic;
  final num prodPrice;
  final bool isSale;
  final int saleAmount;
  final bool view;

  const MyProductWidget({
    Key? key,
    required this.prodName,
    required this.prodManu,
    required this.prodPic,
    required this.prodPrice,
    required this.isSale,
    required this.saleAmount,
    required this.view,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: view
          ? EdgeInsets.only(
              left: Dimensions.width50 / 2,
              right: Dimensions.width50 / 2,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            )
          : EdgeInsets.symmetric(
              horizontal: Dimensions.width20,
              vertical: Dimensions.height10,
            ),
      width: view ? Dimensions.width145 : MediaQuery.of(context).size.width,
      height: view ? Dimensions.height315 : Dimensions.height130,
      child: GestureDetector(
        onLongPress: () {
          showGeneralDialog(
            barrierDismissible: true,
            barrierLabel: 'Barrier',
            barrierColor: Colors.black.withOpacity(0.75),
            context: context,
            pageBuilder: (context, __, ___) {
              return ProductController(
                isSale: isSale,
                picture: prodPic,
                name: prodName,
                manufacturer: prodManu,
                price: prodPrice,
                saleAmount: saleAmount,
              );
            },
          );
        },
        child: view
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: CustomWidgets.isPromotionGrid(
                  isSale: isSale,
                  picture: prodPic,
                  name: prodName,
                  manufacturer: prodManu,
                  price: prodPrice,
                  saleAmount: saleAmount,
                  quantity: 1,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: CustomWidgets.isPromotionList(
                  isSale: isSale,
                  picture: prodPic,
                  name: prodName,
                  manufacturer: prodManu,
                  price: prodPrice,
                  saleAmount: saleAmount,
                  quantity: 1,
                ),
              ),
      ),
    );
  }
}
