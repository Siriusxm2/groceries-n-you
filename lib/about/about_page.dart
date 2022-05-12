import 'package:flutter/material.dart';
import 'package:groceries_n_you/myWidgets/my_app_bar.dart';
import 'package:groceries_n_you/myWidgets/my_bottom_navbar.dart';
import 'package:groceries_n_you/myWidgets/my_drawer.dart';
import 'package:groceries_n_you/myWidgets/my_floating_button.dart';
import 'package:groceries_n_you/myWidgets/my_header.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyHeaderWidget(text: 'For Us'),
          const SizedBox(height: 35),
          Container(
            margin: const EdgeInsets.only(left: 30),
            height: 16,
            child: const Text(
              "For Groceries'N'You",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xff699BFF),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 18),
          const Center(
            child: SizedBox(
              height: 56,
              width: 300,
              child: Text(
                "Ние от Groceries’N’You целим да предоставим бързо и улеснено пазаруване на всички. Предлагаме възможност за осигуряване на повече свободно време за Вас и Вашите близки.",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: SizedBox(
              height: 42,
              width: 300,
              child: Text(
                "Гарантираме качество на доставката и възможност за връщане на продукти при лошо състояние или при липса при доставка.",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: SizedBox(
              height: 56,
              width: 300,
              child: Text(
                "Гарантираме качество на доставката и възможност за връщане на продукти при лошо състояние или при липса при доставка.",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: SizedBox(
              height: 42,
              width: 300,
              child: Text(
                "Гарантираме качество на доставката и възможност за връщане на продукти при лошо състояние или при липса при доставка.",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              height: 1,
              width: 360,
              color: const Color(0xffcccccc),
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      persistentFooterButtons: const [
        Center(
          child: SizedBox(
            width: 320,
            height: 32,
            child: Text(
              "Уебсайтът groceriesnyou.bg е собственост на Ритейл Квартирката АД, БУЛСТАТ 420420420.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: Color(0xff999999),
              ),
            ),
          ),
        ),
      ],
      floatingActionButton: const MyFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: const MyBottomNavbar(),
    );
  }
}
