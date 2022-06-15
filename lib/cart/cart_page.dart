import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_n_you/cart/cart_empty.dart';
import 'package:groceries_n_you/cart/cart_full_page.dart';

import '../blocs/cart/cart_bloc.dart';
import '../myWidgets/widgets.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late TextEditingController _voucher;
  late String voucher;

  @override
  void initState() {
    _voucher = TextEditingController();
    voucher = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CartLoaded) {
          return Column(
            children: [
              const MyHeaderWidget(text: 'Your Cart'),
              state.cart.productQuantity(state.cart.products).keys.isEmpty
                  ? const CartEmptyPage()
                  : const CartFullPage(),
            ],
          );
        } else {
          return const Text('Something went wrong!');
        }
      }),
      drawer: const MyDrawer(),
      floatingActionButton: const MyFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: const MyBottomNavbar(),
    );
  }
}
