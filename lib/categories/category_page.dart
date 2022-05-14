import 'package:flutter/material.dart';
import 'package:groceries_n_you/categories/alcohol/beer/beer_page_tileview.dart';
import 'package:groceries_n_you/customIcons/custom_icons_icons.dart';
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
      body: Column(
        children: [
          const MyHeaderWidget(text: 'Beer'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
              child: Row(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Astika',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333),
                        fontSize: 12,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(80, 40),
                      maximumSize: const Size(100, 40),
                      side: const BorderSide(
                        width: 0.5,
                        color: Color(0xffFFBE57),
                      ),
                      shape: const BeveledRectangleBorder(),
                    ),
                  ),
                  const SizedBox(width: 5),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Tuborg',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333),
                        fontSize: 12,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(80, 40),
                      maximumSize: const Size(100, 40),
                      side: const BorderSide(
                        width: 0.5,
                        color: Color(0xffFFBE57),
                      ),
                      shape: const BeveledRectangleBorder(),
                    ),
                  ),
                  const SizedBox(width: 5),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Tuborg',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333),
                        fontSize: 12,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(80, 40),
                      maximumSize: const Size(100, 40),
                      side: const BorderSide(
                        width: 0.5,
                        color: Color(0xffFFBE57),
                      ),
                      shape: const BeveledRectangleBorder(),
                    ),
                  ),
                  const SizedBox(width: 5),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Tuborg',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333),
                        fontSize: 12,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(80, 40),
                      maximumSize: const Size(100, 40),
                      side: const BorderSide(
                        width: 0.5,
                        color: Color(0xffFFBE57),
                      ),
                      shape: const BeveledRectangleBorder(),
                    ),
                  ),
                  const SizedBox(width: 5),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Tuborg',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333),
                        fontSize: 12,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(80, 40),
                      maximumSize: const Size(100, 40),
                      side: const BorderSide(
                        width: 0.5,
                        color: Color(0xffFFBE57),
                      ),
                      shape: const BeveledRectangleBorder(),
                    ),
                  ),
                  const SizedBox(width: 5),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Tuborg',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333),
                        fontSize: 12,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(80, 40),
                      maximumSize: const Size(100, 40),
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
          const Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Color(0xffcccccc),
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
    );
  }
}
