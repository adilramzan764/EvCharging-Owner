import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/Widgets/Custom Button/Custom Button.dart';
import '../../Utils/Widgets/Custom Text Field/CustomTextField.dart';
import '../../Utils/Widgets/CutomWidgets.dart';
import '../../View Model/ChangePassword_ViewModel.dart';



class ChangePassword extends StatelessWidget {
   ChangePassword({Key? key}) : super(key: key);
   TextEditingController newpassword=TextEditingController();
   TextEditingController confirmpassword=TextEditingController();
   final ChangePasswordViewModel viewModel = ChangePasswordViewModel();



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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.left_chevron,
                        size: 16,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Change Password',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
          SvgPicture.asset('assets/ChangePassword.svg'),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomTextField(icon: Transform.scale
              (scale: 0.5,
                child: SvgPicture.asset('assets/Lock.svg')),hinttext: 'New Password', controller: newpassword,),
          ),
SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomTextField(icon: Transform.scale
              (scale: 0.5,
                child: SvgPicture.asset('assets/Lock.svg')),hinttext: 'Confirm Password', controller: confirmpassword,),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),

          Container(
            height: 32,
            width: 140,
            child: CustomButton(text: 'Save', onPressed: () async {
              SharedPreferences preferences = await SharedPreferences.getInstance();
              String? userId = preferences.getString("id");

              viewModel.changePassword(userId!, newpassword.text, context);

            }),
          ),

        ],
      ),
    );
  }
}
