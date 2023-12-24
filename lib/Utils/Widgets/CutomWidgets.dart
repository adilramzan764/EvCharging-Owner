import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../View/Bottom Navigation/Bottom Navigation.dart';
import '../Color/Color.dart';
import 'Custom Button/Custom Button.dart';

Widget EditProfile_TextField(String icon, String hintext,TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Transform.scale(scale: 0.3, child: SvgPicture.asset(icon)),
        hintText: hintext,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 13),
        // Hint text color
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5)), // Underline color
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
          BorderSide(color: ColorValues.Blue), // Underline color
        ),
      ),
    ),
  );
}


Future<void> ChangePassword_Dialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.38,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset('assets/done.svg'),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Password changed successfully!",
                    style: TextStyle(
                      fontSize: 17,
                      color: ColorValues.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "We recommend that you write down so you don't forget, okay?",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff77787A),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  height: 32,
                  width: 140,
                  child: CustomButton(
                      text: 'Next',
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyBottomNavigationBar()),
                              (route) => false,
                        );

                        // OTPConfirmationDialog(context); // Call the dialog function
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}


Widget CircularImage(String pic, double height, double width) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: NetworkImage(pic), fit: BoxFit.cover)

      // boxShadow: [
      //
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.5),
      //     spreadRadius: 1,
      //
      //
      //   )
      // ]
    ),
  );
}


Widget CircularButtons(
    String icon, VoidCallback onpressed, double height, double width) {
  return InkWell(
    onTap: onpressed,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
            )
          ]),
      child: Center(
        child: SvgPicture.asset(
          icon,
          height: 17,
          width: 17,
        ),
      ),
    ),
  );
}

Future<void> TopuoSuccess_Dialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.38,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset('assets/done.svg'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Withdraw Successful! ",
                  style: TextStyle(
                    fontSize: 17,
                    color: ColorValues.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "A total amount of \$64844 has been  added to your account",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff77787A),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  height: 32,
                  width: 140,
                  child: CustomButton(
                      text: 'Next',
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyBottomNavigationBar()),
                              (route) => false,
                        );

                        // OTPConfirmationDialog(context); // Call the dialog function
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}


Widget TextField_Search(BuildContext context) {
  FocusNode _focusNode = FocusNode();

  return Container(
    height: 35,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          spreadRadius: 1,
          blurRadius: 1,
        ),
      ],
    ),
    child: Focus(
      onFocusChange: (hasFocus) {
        _focusNode.dispose();
      },
      child: TextFormField(
        // onTap: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) =>
        //           SearchScreen(), // Replace with your next screen widget.
        //     ),
        //   );
        // },
        focusNode: _focusNode,
        decoration: InputDecoration(
          prefixIcon: Transform.scale(
              scale: 0.4, child: SvgPicture.asset('assets/Search.svg')),
          hintText: 'Search here',
          suffixIcon: Transform.scale(
              scale: 0.4, child: SvgPicture.asset('assets/microphone.svg')),
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.5),
            fontSize: 11,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    ),
  );
}
