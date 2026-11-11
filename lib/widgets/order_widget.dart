import 'package:flutter/material.dart';
import 'package:medicalapp/const.dart';
import 'package:medicalapp/models/order.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(kDefaultPadding / 2),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: thirdColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(order.owner),
          Text(order.mname),
          Text(order.mqunatity),
          Text(order.oprice),
          Text(order.ostate),
          Text(order.pstate),
          Text(order.create),
        ],
      ),
    );
  }
}
