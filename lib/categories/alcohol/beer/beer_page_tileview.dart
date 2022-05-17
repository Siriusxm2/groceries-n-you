import 'package:flutter/material.dart';
import 'package:groceries_n_you/dimensions.dart';
import 'package:groceries_n_you/myWidgets/my_product.dart';

class BeerPageTileView extends StatelessWidget {
  const BeerPageTileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.height10),
      width: MediaQuery.of(context).size.width - Dimensions.width20,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: const [
          MyProductWidget(
            prodName: 'Amstel Premium Pilsener - 0,5 Л кен',
            isSale: true,
            saleAmount: 33,
          ),
          MyProductWidget(
            prodName: 'Amstel Premium Pilsener - 0,5 Л стъкло',
            isSale: false,
            saleAmount: 0,
          ),
          MyProductWidget(
            prodName: 'Ариана светло пиво - 0,5Л кен',
            isSale: false,
            saleAmount: 0,
          ),
          MyProductWidget(
            prodName: 'Ариана светло пиво - 0,5Л стъкло',
            isSale: true,
            saleAmount: 20,
          ),
        ],
      ),
    );
  }
}
