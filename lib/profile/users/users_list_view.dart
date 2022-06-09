import 'package:flutter/material.dart';
import 'package:groceries_n_you/services/crud/orders_service.dart';

class UsersListView extends StatelessWidget {
  final List<DatabaseUser> users;

  const UsersListView({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          title: Text(
            user.toString(),
            //maxLines: 1,
            softWrap: true,
            //overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        );
      },
    );
  }
}
