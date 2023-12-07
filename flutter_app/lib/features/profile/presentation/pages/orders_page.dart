import 'package:flutter/material.dart';
import 'package:skia_coffee/features/profile/presentation/widgets/order_details_card.dart';
import 'package:skia_coffee/features/profile/presentation/widgets/search_bar_widget.dart';

import '../../../../core/constants/consts.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBg,
      appBar: AppBar(
        title: const Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Orders",
                style: TextStyle(
                    fontFamily: regular,
                    fontSize: 24,
                    color: textColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500)),
          ]),
        ),
        surfaceTintColor: Colors.white,
        centerTitle: true,
        backgroundColor: greyBg,
        elevation: 1.0,
        toolbarHeight: 60 * ((MediaQuery.of(context).size.height) / 844),
        shadowColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            height: 62,
            color: white,
            child: const SearchBarWidget(),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return OrderDetailCardWidget(id: 0);
                  }))
        ],
      ),
    );
  }
}
