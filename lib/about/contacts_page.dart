import 'package:flutter/material.dart';
import 'package:groceries_n_you/myWidgets/my_app_bar.dart';
import 'package:groceries_n_you/myWidgets/my_bottom_navbar.dart';
import 'package:groceries_n_you/myWidgets/my_drawer.dart';
import 'package:groceries_n_you/myWidgets/my_expansion_tile.dart';
import 'package:groceries_n_you/myWidgets/my_floating_button.dart';
import 'package:groceries_n_you/myWidgets/my_google_map.dart';
import 'package:groceries_n_you/myWidgets/my_header.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyHeaderWidget(text: 'Contacts'),
            // GOOGLE MAPS
            Container(
              height: 260,
              child: const MyGoogleMaps(),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: const Color(0xffCCCCCC),
                ),
              ),
              margin: const EdgeInsets.only(bottom: 10),
            ),
            // CONTACT INFO
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff333333),
                        ),
                        children: [
                          TextSpan(
                            text: 'Email:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: ' help@gny.bg'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff333333),
                        ),
                        children: [
                          TextSpan(
                            text: 'Phone:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: ' 0123 456 789'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff333333),
                        ),
                        children: [
                          TextSpan(
                            text: 'Address:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                              text: ' Varna, Levski 9010, ul. Studentska 1'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
              thickness: 1,
              color: Color(0xffcccccc),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: const Text(
                'Frequently asked questions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xff333333),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width - 80,
                  child: const Text(
                    'Feedback',
                    style: TextStyle(
                      color: Color(0xff699BFF),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                MyExpansionTile(
                  'What dod',
                  'idk man fr fr idk man fr fr idk man fr fr idk man fr fr idk man fr fr idk man fr fr idk man fr fr ',
                ),
                MyExpansionTile(
                  'Nah man',
                  'watchu want cuh',
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width - 80,
                  child: const Text(
                    'Delivery',
                    style: TextStyle(
                      color: Color(0xff699BFF),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                MyExpansionTile(
                  'What do',
                  'idk man fr fr',
                ),
                MyExpansionTile(
                  'Nah man',
                  'watchu want cuh',
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width - 80,
                  child: const Text(
                    'Payment',
                    style: TextStyle(
                      color: Color(0xff699BFF),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                MyExpansionTile(
                  'What do',
                  'idk man fr fr',
                ),
                MyExpansionTile(
                  'Nah man',
                  'watchu want cuh',
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
      floatingActionButton: const MyFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: const MyBottomNavbar(),
    );
  }
}
