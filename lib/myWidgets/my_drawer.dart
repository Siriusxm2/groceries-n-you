import 'package:flutter/material.dart';
import 'package:groceries_n_you/constants/routes.dart';
import 'package:groceries_n_you/dimensions.dart';
import 'package:groceries_n_you/myWidgets/my_list_tile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: Dimensions.height140,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xffFFAE2D),
                  //offset: Offset(0, 0.2),
                )
              ],
            ),
            child: DrawerHeader(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Row(
                children: [
                  Container(
                    height: Dimensions.height20,
                    width: Dimensions.width10,
                    color: const Color(0xffFFAE2D),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width5),
                    child: Text(
                      'CATEGORIES',
                      style: TextStyle(
                        fontSize: Dimensions.font24,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffFFAE2D),
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.height20,
                    width: Dimensions.width130,
                    color: const Color(0xffFFAE2D),
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                color: Color(0xff4382FF),
              ),
            ),
          ),
          MyListTileMain(
            'assets/categoryMeat.png',
            'MEEEATS',
            () {},
          ),
          MyListTileMain(
            'assets/categoryMeat.png',
            'MEEEATS',
            () {},
          ),
          MyListTileMain(
            'assets/categoryMeat.png',
            'MEEEATS',
            () {},
          ),
          MyListTileMain(
            'assets/categoryMeat.png',
            'MEEEATS',
            () {},
          ),
          MyListTileMain(
            'assets/categoryMeat.png',
            'MEEEATS',
            () {},
          ),
          // ExpansionTile
          MyListTileExpand(
            children: [
              MyListTileSub(
                'View all',
                () {},
                const SizedBox(),
              ),
              MyListTileSub(
                'Highly alcoholic',
                () {},
                const SizedBox(),
              ),
              MyListTileSub(
                'Wine',
                () {},
                const SizedBox(),
              ),
              MyListTileSub(
                'Beer',
                () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    categoryRoute,
                    (route) => true,
                  );
                },
                const SizedBox(),
              ),
            ],
            imageAsset: Image.asset('assets/categoryAlcohol.png'),
            bgColor: const Color(0xff699BFF),
            borderColor: const Color(0xffB4CDFF),
            text: 'Alcohol',
          ),
        ],
      ),
    );
  }
}
