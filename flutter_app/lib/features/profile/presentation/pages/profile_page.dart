import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/profile/presentation/widgets/iteem_widget.dart';
import 'package:skia_coffee/features/profile/presentation/widgets/logout_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences _prefs;
  String _savedText = '';
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    // Retrieve the saved text from SharedPreferences
    _savedText = _prefs.getString('UserName') ?? 'Name';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<String> headings = [
      "Orders",
      "Wishlist",
      "Help and Support",
      "Addresses",
      "Profile"
    ];
    List<String> descriptions = [
      "Check your order status (track, return, cancel etc)",
      "Buy from items saved in Wishlist",
      "Get help for your account or orders",
      "Manage your saved addressses",
      "Edit your profile information"
    ];
    return Scaffold(
        backgroundColor: white,
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
          backgroundColor: Colors.white,
          elevation: 1.0,
          toolbarHeight: 60,
          shadowColor: Colors.white,
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        "Hey $_savedText",
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 40,
                          fontFamily: bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ClipOval(
                      child: CircleAvatar(
                        child: Image.asset(icDp),
                        radius: 38,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Text(
                        "Logged in via vivek23@gmail.com",
                        style: TextStyle(
                            color: textLightColor,
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 80,
                        child: Divider(
                          thickness: 1,
                          color: Colors.black26,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 5) return const LogOutButton();
                      return ItemWigdet(
                          head: headings[index], desc: descriptions[index]);
                    }),
              )
            ],
          ),
        ));
  }
}