import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/product/presentation/widgets/coffee_cart_widget.dart';
import 'package:skia_coffee/features/product/presentation/widgets/continue_button.dart';
import 'package:skia_coffee/features/product/presentation/widgets/delivery_address_widget.dart';
import 'package:skia_coffee/features/product/presentation/widgets/price_details_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBg,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Cart",
                style: TextStyle(
                    fontFamily: regular,
                    fontSize: 24,
                    color: textColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500)),
            Text("Wishlist",
                style: TextStyle(
                    fontFamily: regular,
                    fontSize: 10,
                    color: textColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400)),
          ]),
        ),
        surfaceTintColor: Colors.white,
        centerTitle: true,
        backgroundColor: greyBg,
        elevation: 1.0,
        toolbarHeight: 60 * ((MediaQuery.of(context).size.height) / 844),
        shadowColor: Colors.white,
      ),
      body: Column(children: [
        const DeliveryAddressWidget(),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              if (index == 2) return const PriceDetailWidget();

              return const CoffeCartWidget();
            },
          ),
        ),
        const ContinueButton(),
      ]),
    );
  }
}
