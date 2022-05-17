import 'package:flutter/material.dart';
import 'package:groceries_n_you/categories/product_controller.dart';
import 'package:groceries_n_you/custom_widget_functions.dart';
import 'package:groceries_n_you/dimensions.dart';
import 'package:groceries_n_you/services/crud/orders_service.dart';

class MyProductWidget extends StatefulWidget {
  final String prodName;
  final bool isSale;
  final int saleAmount;
  const MyProductWidget(
      {Key? key,
      required this.prodName,
      required this.isSale,
      required this.saleAmount})
      : super(key: key);

  @override
  State<MyProductWidget> createState() => _MyProductWidgetState();
}

class _MyProductWidgetState extends State<MyProductWidget> {
  late final OrdersService _ordersService;
  late final String pName;
  late final bool isSale;
  late final int saleAmount;

  @override
  void initState() {
    _ordersService = OrdersService();
    pName = widget.prodName;
    isSale = widget.isSale;
    saleAmount = widget.saleAmount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.width20,
        right: Dimensions.width20,
        top: Dimensions.height10,
        bottom: Dimensions.height10,
      ),
      width: Dimensions.width145,
      height: Dimensions.height315,
      child: FutureBuilder(
        future: _ordersService.getProduct(name: pName),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final product = snapshot.data as DatabaseProduct;
              return GestureDetector(
                onLongPress: () {
                  showGeneralDialog(
                    barrierDismissible: true,
                    barrierLabel: 'Barrier',
                    barrierColor: Colors.black.withOpacity(0.75),
                    context: context,
                    pageBuilder: (context, __, ___) {
                      return ProductController(
                        isSale: isSale,
                        picture: product.productPicture,
                        name: product.productName,
                        manufacturer: product.productManufacturer,
                        price: product.productPrice,
                        saleAmount: saleAmount,
                      );
                    },
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: CustomWidgets.isPromotion(
                    isSale: isSale,
                    picture: product.productPicture,
                    name: product.productName,
                    manufacturer: product.productManufacturer,
                    price: product.productPrice,
                    saleAmount: saleAmount,
                    quantity: 0,
                  ),
                ),
              );
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
