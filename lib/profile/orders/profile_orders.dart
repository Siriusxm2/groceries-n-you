import 'package:flutter/material.dart';
import 'package:groceries_n_you/myWidgets/my_app_bar.dart';
import 'package:groceries_n_you/myWidgets/my_bottom_navbar.dart';
import 'package:groceries_n_you/myWidgets/my_drawer.dart';
import 'package:groceries_n_you/myWidgets/my_floating_button.dart';
import 'package:groceries_n_you/myWidgets/my_header.dart';
import 'package:groceries_n_you/services/auth/auth_service.dart';
import 'package:groceries_n_you/services/crud/orders_service.dart';

class ProfileOrdersPage extends StatefulWidget {
  const ProfileOrdersPage({Key? key}) : super(key: key);

  @override
  State<ProfileOrdersPage> createState() => _ProfileOrdersPageState();
}

class _ProfileOrdersPageState extends State<ProfileOrdersPage> {
  String get userEmail => AuthService.firebase().currentUser!.email!;
  late final OrdersService _ordersService;

  @override
  void initState() {
    _ordersService = OrdersService();
    super.initState();
  }

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
          const MyHeaderWidget(text: 'Order history'),
          FutureBuilder(
            future: _ordersService.getOrCreateUser(email: userEmail),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return StreamBuilder(
                    stream: _ordersService.allProducts,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Text('No previous orders.');
                        case ConnectionState.active:
                          if (snapshot.hasData) {
                            final allProducts =
                                snapshot.data as List<DatabaseProduct>;
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: allProducts.length,
                              itemBuilder: (context, index) {
                                final prod = allProducts[index];
                                return ListTile(
                                  title: Text(prod.toString()),
                                );
                              },
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        default:
                          return const CircularProgressIndicator();
                      }
                    },
                  );
                default:
                  return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
