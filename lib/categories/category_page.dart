import 'package:flutter/material.dart';
import 'package:groceries_n_you/categories/alcohol/beer/beer_page_tileview.dart';
import 'package:groceries_n_you/customIcons/custom_icons_icons.dart';
import 'package:groceries_n_you/dimensions.dart';
import 'package:groceries_n_you/myWidgets/my_app_bar.dart';
import 'package:groceries_n_you/myWidgets/my_bottom_navbar.dart';
import 'package:groceries_n_you/myWidgets/my_drawer.dart';
import 'package:groceries_n_you/myWidgets/my_floating_button.dart';
import 'package:groceries_n_you/myWidgets/my_header.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const MyDrawer(),
      floatingActionButton: const MyFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: const MyBottomNavbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyHeaderWidget(text: 'Beer'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.fromLTRB(
                  Dimensions.width20,
                  Dimensions.height10,
                  0,
                  Dimensions.height10,
                ),
                child: Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Astika',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff333333),
                          fontSize: Dimensions.font12,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize:
                            Size(Dimensions.width80, Dimensions.height40),
                        maximumSize:
                            Size(Dimensions.width100, Dimensions.height40),
                        side: const BorderSide(
                          width: 0.5,
                          color: Color(0xffFFBE57),
                        ),
                        shape: const BeveledRectangleBorder(),
                      ),
                    ),
                    SizedBox(width: Dimensions.width5),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Tuborg',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff333333),
                          fontSize: Dimensions.font12,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize:
                            Size(Dimensions.width80, Dimensions.height40),
                        maximumSize:
                            Size(Dimensions.width100, Dimensions.height40),
                        side: const BorderSide(
                          width: 0.5,
                          color: Color(0xffFFBE57),
                        ),
                        shape: const BeveledRectangleBorder(),
                      ),
                    ),
                    SizedBox(width: Dimensions.width5),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Tuborg',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff333333),
                          fontSize: Dimensions.font12,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize:
                            Size(Dimensions.width80, Dimensions.height40),
                        maximumSize:
                            Size(Dimensions.width100, Dimensions.height40),
                        side: const BorderSide(
                          width: 0.5,
                          color: Color(0xffFFBE57),
                        ),
                        shape: const BeveledRectangleBorder(),
                      ),
                    ),
                    SizedBox(width: Dimensions.width5),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Tuborg',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff333333),
                          fontSize: Dimensions.font12,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize:
                            Size(Dimensions.width80, Dimensions.height40),
                        maximumSize:
                            Size(Dimensions.width100, Dimensions.height40),
                        side: const BorderSide(
                          width: 0.5,
                          color: Color(0xffFFBE57),
                        ),
                        shape: const BeveledRectangleBorder(),
                      ),
                    ),
                    SizedBox(width: Dimensions.width5),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Tuborg',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff333333),
                          fontSize: Dimensions.font12,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize:
                            Size(Dimensions.width80, Dimensions.height40),
                        maximumSize:
                            Size(Dimensions.width100, Dimensions.height40),
                        side: const BorderSide(
                          width: 0.5,
                          color: Color(0xffFFBE57),
                        ),
                        shape: const BeveledRectangleBorder(),
                      ),
                    ),
                    SizedBox(width: Dimensions.width5),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Tuborg',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff333333),
                          fontSize: Dimensions.font12,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize:
                            Size(Dimensions.width80, Dimensions.height40),
                        maximumSize:
                            Size(Dimensions.width100, Dimensions.height40),
                        side: const BorderSide(
                          width: 0.5,
                          color: Color(0xffFFBE57),
                        ),
                        shape: const BeveledRectangleBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1,
              indent: Dimensions.width10,
              endIndent: Dimensions.width10,
              color: const Color(0xffcccccc),
            ),
            Row(
              children: const [
                Icon(CustomIcons.gridView),
                Icon(CustomIcons.listView),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Color(0xffcccccc),
            ),
            const BeerPageTileView(),
          ],
        ),
      ),
    );
  }
}
