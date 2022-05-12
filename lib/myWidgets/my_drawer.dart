import 'package:flutter/material.dart';
import 'package:groceries_n_you/customIcons/custom_icons_icons.dart';
import 'package:groceries_n_you/myWidgets/my_list_tile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

bool _isExpanded = false;

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 140,
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
                    height: 20,
                    width: 10,
                    color: const Color(0xffFFAE2D),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: const Text(
                      'CATEGORIES',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFAE2D),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 132,
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
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xffB4CDFF),
                ),
              ),
              color: Color(0xff699BFF),
            ),
            child: ExpansionTile(
              onExpansionChanged: (value) {
                setState(() {
                  _isExpanded = value;
                });
              },
              leading: Image.asset('assets/categoryMeat.png'),
              title: const Text(
                'Meats',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFFAE2D),
                ),
              ),
              trailing: Icon(
                !_isExpanded ? Icons.add : CustomIcons.minus,
                color: const Color(0xffFFAE2D),
              ),
              children: [
                MyListTileSub(
                  'MINCED',
                  () {},
                ),
                // ExpansionTile
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xffD9E6FF),
                      ),
                    ),
                    color: Color(0xff8EB4FF),
                  ),
                  child: ExpansionTile(
                    onExpansionChanged: (value) {
                      setState(() {
                        _isExpanded = value;
                      });
                    },
                    title: const Text(
                      'Meats',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFAE2D),
                      ),
                    ),
                    trailing: Icon(
                      !_isExpanded ? Icons.add : CustomIcons.minus,
                      color: const Color(0xffFFAE2D),
                    ),
                    children: [
                      MyListTileSubSub(
                        'RED',
                        () {},
                      ),
                      MyListTileSubSub(
                        'RED',
                        () {},
                      ),
                      MyListTileSubSub(
                        'RED',
                        () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
