import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skia_coffee/features/customizeBlend/presentation/pages/blend_name_page.dart';
import 'package:skia_coffee/features/home/presentation/widgets/coffee_card_item.dart';
import 'package:skia_coffee/features/home/presentation/widgets/custom_blend.dart';
import 'package:skia_coffee/features/home/presentation/widgets/lets_go_button.dart';
import 'package:skia_coffee/features/product/presentation/pages/product_details_page.dart';
import '../../../../core/constants/consts.dart';

class HomeScreen extends StatefulWidget {
  final int currentPage;
  const HomeScreen({super.key, required this.currentPage});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final PageController pageController =
        PageController(initialPage: widget.currentPage);
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: textColor,
                  ),
                  Image(image: AssetImage(icLogo)),
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: textColor,
                  ),
                ],
              ),
            ),
            surfaceTintColor: Colors.white,
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: appBarbg.withOpacity(0.5),
            toolbarHeight: 60,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 310,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              appBarbg.withOpacity(0.5), BlendMode.srcOver),
                          image: const AssetImage(icBackgoundQuiz),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 70),
                              child: Text(
                                "What are you drinking today?",
                                style: TextStyle(
                                  fontFamily: bold,
                                  fontSize: 28,
                                  color: textColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 250,
                                height: 160,
                                child: Image.asset(icCoffeePackets),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CustomBlendWidget(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Skià Special",
                          style: TextStyle(
                              fontFamily: bold,
                              fontSize: 14,
                              color: textColor)),
                      Row(
                        children: [
                          Text("View more",
                              style: TextStyle(
                                  fontFamily: regular,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: textLightColor)),
                          Icon(Icons.arrow_forward_outlined),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SizedBox(
                    height: 220.0, // Adjust the height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5, // Adjust the number of cards as needed
                      itemBuilder: (context, index) {
                        return const CoffeCardItem();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22, bottom: 16),
                  child: Expanded(
                    child: Container(
                      height: 214,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(icBlendBg), fit: BoxFit.cover),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Expanded(
                                    child: Text(
                                      "Farm to Cup Journey",
                                      style: GoogleFonts.notoSerifGeorgian(
                                          fontSize: 32,
                                          color: textColor,
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 16, bottom: 16, right: 16),
                                  child: Text(
                                    "Know the journey of your coffee beans from the lush farms of Coorg to your cup",
                                    style: TextStyle(
                                        fontFamily: regular,
                                        fontSize: 10,
                                        color: textColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(height: 2),
                              LetsGoButton(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Your Special",
                          style: TextStyle(
                              fontFamily: bold,
                              fontSize: 14,
                              color: textColor)),
                      Row(
                        children: [
                          Text("View more",
                              style: TextStyle(
                                  fontFamily: regular,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: textLightColor)),
                          Icon(Icons.arrow_forward_outlined),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SizedBox(
                    height: 220.0, // Adjust the height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5, // Adjust the number of cards as needed
                      itemBuilder: (context, index) {
                        return const CoffeCardItem();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const CustomBlendName(),
        const ProductDetailsPage(),
      ],
    );
  }
}
