import 'package:flutter/material.dart';
import 'package:groceries_n_you/custom_widget_functions.dart';
import 'package:groceries_n_you/dimensions.dart';

class ProductController extends StatefulWidget {
  final bool isSale;
  final String picture;
  final String name;
  final String manufacturer;
  final num price;
  final int saleAmount;

  const ProductController({
    Key? key,
    required this.isSale,
    required this.picture,
    required this.name,
    required this.manufacturer,
    required this.price,
    required this.saleAmount,
  }) : super(key: key);

  @override
  State<ProductController> createState() => _ProductControllerState();
}

class _ProductControllerState extends State<ProductController> {
  int _quantity = 0;
  int _inCartItems = 0;
  int get quantity => _quantity;
  int get inCartItems => _inCartItems + _quantity;

  late bool isSale;
  late String picture;
  late String name;
  late String manufacturer;
  late num price;
  late int saleAmount;

  @override
  void initState() {
    isSale = widget.isSale;
    picture = widget.picture;
    name = widget.name;
    manufacturer = widget.manufacturer;
    price = widget.price;
    saleAmount = widget.saleAmount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Dimensions.width360,
        height: Dimensions.height190,
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.border10),
            side: const BorderSide(
              color: Color(0xff4382FF),
              width: 3,
            ),
          ),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // picture
              Container(
                margin: EdgeInsets.only(
                  left: Dimensions.width15,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                ),
                width: Dimensions.width145,
                height: Dimensions.height170,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffc4c4c4),
                    width: 1,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage(picture),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                ),
                padding: EdgeInsets.only(
                  left: Dimensions.width15,
                  right: Dimensions.width15,
                ),
                width: Dimensions.width360 -
                    Dimensions.width15 -
                    Dimensions.width145,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // product name
                    Padding(
                      padding: EdgeInsets.only(top: Dimensions.height10),
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: Dimensions.font14,
                          color: const Color(0xff333333),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    // manufacturer
                    Container(
                      margin: EdgeInsets.only(bottom: Dimensions.height10),
                      child: Text(
                        manufacturer,
                        style: TextStyle(
                          fontSize: Dimensions.font12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffcccccc),
                        ),
                      ),
                    ),
                    // price - promotion
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: CustomWidgets.promotionGrid(
                          isSale, price, saleAmount, quantity),
                    ),
                    // add button
                    Padding(
                      padding: EdgeInsets.only(bottom: Dimensions.height10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xff333333),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xffFFBE57),
                                ),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          setQuantity(false);
                                        });
                                      },
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    Container(
                                      width: Dimensions.width30,
                                      height: Dimensions.height30,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                            color: Color(0xff333333),
                                            width: 1,
                                          ),
                                          right: BorderSide(
                                            color: Color(0xff333333),
                                            width: 1,
                                          ),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        quantity < 1
                                            ? '1'
                                            : quantity.toString(),
                                        style: TextStyle(
                                          fontSize: Dimensions.font18,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          setQuantity(true);
                                        });
                                      },
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset('assets/cart.png'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
  }

  int checkQuantity(int q) {
    if (q < 1) {
      return 1;
    } else if (q > 99) {
      return 99;
    } else {
      return q;
    }
  }

  void initProduct() {
    _quantity = 0;
    _inCartItems = 0;
  }
}
