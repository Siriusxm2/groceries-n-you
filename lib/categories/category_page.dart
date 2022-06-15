import 'package:flutter/material.dart';
import 'package:groceries_n_you/customIcons/custom_icons_icons.dart';
import 'package:groceries_n_you/dimensions.dart';

import '../myWidgets/widgets.dart';
import 'alcohol/beer/beer_count.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late bool _gridState;
  late bool _listState;

  @override
  void initState() {
    _gridState = true;
    _listState = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Products p = Products();

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
                        'Heineken',
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
                        'Ariana',
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
                        'Shumensko',
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
                        'Pirinsko',
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    CustomIcons.gridView,
                    color: _gridState
                        ? const Color(0xff333333)
                        : const Color(0xffcccccc),
                  ),
                  onPressed: () {
                    setState(() {
                      _gridState = true;
                      _listState = false;
                    });
                  },
                ),
                SizedBox(width: Dimensions.width50 / 2),
                IconButton(
                  icon: Icon(
                    CustomIcons.listView,
                    color: _listState
                        ? const Color(0xff333333)
                        : const Color(0xffcccccc),
                  ),
                  onPressed: () {
                    setState(() {
                      _listState = true;
                      _gridState = false;
                    });
                  },
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Color(0xffcccccc),
            ),
            Container(
              margin: EdgeInsets.only(top: Dimensions.height10),
              //width: MediaQuery.of(context).size.width - Dimensions.width40,
              child: _gridState
                  ? Wrap(
                      alignment: WrapAlignment.center,
                      children: p.convertToView(_gridState),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: p.convertToView(_gridState),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
