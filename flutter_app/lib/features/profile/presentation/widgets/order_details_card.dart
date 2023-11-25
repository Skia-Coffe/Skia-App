import 'package:flutter/material.dart';
import 'package:skia_coffee/features/profile/presentation/widgets/delivered_widget.dart';

class OrderDetailCardWidget extends StatefulWidget {
  final int id;
  const OrderDetailCardWidget({super.key, required this.id});

  @override
  State<OrderDetailCardWidget> createState() => _OrderDetailCardWidgetState();
}

class _OrderDetailCardWidgetState extends State<OrderDetailCardWidget> {
  @override
  Widget build(BuildContext context) {
    // if (widget.id == 0) {
    return const DeliveredWidget();
    // } else
    //   return ActiverOrderWidget();
  }
}
