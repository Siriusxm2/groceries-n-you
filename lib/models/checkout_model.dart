import 'package:equatable/equatable.dart';

import 'product_model.dart';

class CheckoutModel extends Equatable {
  final String? name;
  final String? email;
  final String? address;
  final String? phone;
  final List<ProductModel>? products;
  final num? subtotal;
  final num? deliveryFee;
  final num? voucher;
  final num? total;

  const CheckoutModel({
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.voucher,
    required this.total,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        address,
        phone,
        products,
        subtotal,
        deliveryFee,
        voucher,
        total,
      ];
}
