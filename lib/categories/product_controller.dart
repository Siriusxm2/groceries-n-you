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
  int get quantity => _quantity;

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
          borderRadius: BorderRadius.circular(Dimensions.border10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width10,
                ),
                width: Dimensions.width145,
                height: Dimensions.height170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage(picture),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: Dimensions.width20),
                width: Dimensions.width300 / 2,
                height: Dimensions.height200 / 2,
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimensions.height30,
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: Dimensions.font13,
                          color: const Color(0xff333333),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: CustomWidgets.promotion(
                            isSale, price, saleAmount, quantity),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height40,
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
    if (q < 0) {
      return 0;
    } else if (q > 99) {
      return 99;
    } else {
      return q;
    }
  }
}
