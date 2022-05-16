import 'package:flutter/material.dart';
import 'package:groceries_n_you/custom_widget_functions.dart';
import 'package:groceries_n_you/dimensions.dart';
import 'package:groceries_n_you/services/crud/orders_service.dart';

class MyProductWidget extends StatefulWidget {
  final String prodName;
  final bool isSale;
  const MyProductWidget(
      {Key? key, required this.prodName, required this.isSale})
      : super(key: key);

  @override
  State<MyProductWidget> createState() => _MyProductWidgetState();
}

class _MyProductWidgetState extends State<MyProductWidget> {
  late final OrdersService _ordersService;
  late final String _pName;
  late final bool _isSale;

  @override
  void initState() {
    _ordersService = OrdersService();
    _pName = widget.prodName;
    _isSale = widget.isSale;
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
        future: _ordersService.getProduct(name: _pName),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final product = snapshot.data as DatabaseProduct;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: CustomWidgets.isPromotion(
                  isSale: _isSale,
                  picture: product.productPicture,
                  name: product.productName,
                  manufacturer: product.productManufacturer,
                  price: product.productPrice,
                  saleAmount: 33,
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
