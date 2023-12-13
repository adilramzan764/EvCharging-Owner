

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Utils/Assets/Assets.dart';
import '../../../Utils/Color/Color.dart';
import '../../../Utils/Widgets/CutomWidgets.dart';
import '../../AccountOption_Screens/ChangePassword.dart';
import '../../AccountOption_Screens/EditProfile.dart';
import '../../AccountOption_Screens/HelpandFAQs.dart';
import '../../AccountOption_Screens/Language.dart';
import '../../AccountOption_Screens/MyWallet.dart';
import '../../AccountOption_Screens/PaymentMethods.dart';
import '../../AccountOption_Screens/PrivacyPolicy.dart';
import '../../Sign In/SignIn.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _AccountState();
}

class _AccountState extends State<Settings> {
  final List<String> icons = [
    'assets/blue profile.svg',
    'assets/paymentmethod.svg',
    'assets/blueLock.svg',
    'assets/privacypolicy.svg',
    'assets/notification.svg',
    'assets/language.svg',
    'assets/help.svg',
  ];

  final List<String> texts = [
    'Edit Profile',
    'Payment Prefrences',
    'Change Password',
    'Privacy & Policy ',
    'Notification',
    'Language',
    'Help and FAQs',
  ];

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 85,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 1),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Setting',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      CircularImage(ImageAssets.model, 70, 70),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hamza Abbasi',
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '+1 (339) 215-9749',
                            style: TextStyle(
                                color: Colors.grey.withOpacity(0.7),
                                fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.37,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1),
                    ],
                  ),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: icons.length, // Number of items in your list
                      itemBuilder: (BuildContext context, int index) {
                        // Return a widget for each item at the specified index
                        return InkWell(
                          onTap: () {
                            if (texts[index] == 'Edit Profile')
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditProfile(), // Replace with your next screen widget.
                                ),
                              );
                            // if (texts[index] == 'My Wallet')
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         MyWallet(), // Replace with your next screen widget.
                              //   ),
                              // );
                            if (texts[index] == 'Payment Prefrences')
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PaymentMethods(), // Replace with your next screen widget.
                                ),
                              );
                            if (texts[index] == 'Privacy & Policy ')
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PrivacyPolicy(), // Replace with your next screen widget.
                                ),
                              );
                            if (texts[index] == 'Language')
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Language(), // Replace with your next screen widget.
                                ),
                              );
                            if (texts[index] == 'Help and FAQs')
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HelpandFAQs(), // Replace with your next screen widget.
                                ),
                              );
                            if (texts[index] == 'Change Password')
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ChangePassword(), // Replace with your next screen widget.
                                ),
                              );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(icons[index]),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  texts[index],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: texts[index] == 'Notification'
                                          ? MediaQuery.removePadding(
                                        context: context,
                                        removeTop: true,
                                        removeBottom: true,
                                        removeLeft: true,
                                        removeRight: false,
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          child: Transform.scale(
                                            scale: 0.6,
                                            // Adjust the scale factor as needed
                                            child: Switch(
                                              value: switchValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  switchValue = value;
                                                });
                                              },
                                              activeColor:
                                              ColorValues.Blue,
                                            ),
                                          ),
                                        ),
                                      )
                                          : Icon(
                                        CupertinoIcons.right_chevron,
                                        size: 16,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                          (route) => false,
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/signout.svg'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign Out',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  CupertinoIcons.right_chevron,
                                  size: 16,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          )
        ],
      ),
    );
  }
}