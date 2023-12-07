import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/colors.dart';
import 'package:skia_coffee/features/profile/presentation/widgets/change_button.dart';

import '../../../../core/constants/consts.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: const Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Profile",
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 180,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(icSplashScreen2),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 80),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: CircleAvatar(
                              child: Image.asset(icDp),
                              radius: 60,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.radio_button_checked,
                                        color: textColor),
                                    Text("Miss")
                                  ],
                                ),
                                SizedBox(width: 10),
                                Row(
                                  children: [
                                    Icon(Icons.radio_button_checked,
                                        color: textColor),
                                    Text("Mr")
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(
                            color: textLightColor,
                            fontFamily: regular,
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: TextStyle(
                            color: textLightColor,
                            fontFamily: regular,
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        labelStyle: TextStyle(
                            color: textLightColor,
                            fontFamily: regular,
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: ChangeButton(),
                        labelStyle: TextStyle(
                            color: textLightColor,
                            fontFamily: regular,
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: "DOB",
                        labelStyle: TextStyle(
                            color: textLightColor,
                            fontFamily: regular,
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
