import 'package:flutter/material.dart';
import 'package:groceries_n_you/profile/users/users_list_view.dart';
import 'package:groceries_n_you/services/crud/orders_service.dart';

import '../../myWidgets/widgets.dart';
import '../../services/auth/auth_service.dart';

class AdminUsersPage extends StatefulWidget {
  const AdminUsersPage({Key? key}) : super(key: key);

  @override
  State<AdminUsersPage> createState() => _AdminUsersPageState();
}

class _AdminUsersPageState extends State<AdminUsersPage> {
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
          const MyHeaderWidget(text: 'All Users'),
          FutureBuilder(
            future: _ordersService.getAllUsers(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return StreamBuilder(
                    stream: _ordersService.allUsers,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Text('No users.');
                        case ConnectionState.active:
                          if (snapshot.hasData) {
                            final allUsers =
                                snapshot.data as List<DatabaseUser>;
                            return UsersListView(users: allUsers);
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
