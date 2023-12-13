import 'package:car_charging/Utils/Assets/Assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Utils/Color/Color.dart';
import '../../Utils/Widgets/Custom Button/Custom Button.dart';
import '../../Utils/Widgets/Custom Text Field/CustomTextField.dart';
import '../Bottom Navigation/Bottom Navigation.dart';
import '../ForgetPassword/ForgetPasswrod.dart';
import '../Sign Up/SignUp.dart';


class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.46,
                width: double.infinity,
                child: Image.asset(
                  ImageAssets.signin,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.62,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorValues.whiteColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        'Sign In',
                        style: TextStyle(
                            color: ColorValues.Gray,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomTextField(
                          icon: Transform.scale(
                              scale: 0.4,
                              child: SvgPicture.asset(
                                ImageAssets.MailBox,
                              )),
                          hinttext: 'johnsondoe@nomail.com.',
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomTextField(
                          icon: Transform.scale(
                              scale: 0.4,
                              child: SvgPicture.asset(
                                ImageAssets.Lock,
                              )),
                          hinttext: '********',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0, top: 4),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ForgetPassword(), // Replace with your next screen widget.
                                  ),
                                );
                              },
                              child: Text(
                                'Forget Password?',
                                style: TextStyle(fontSize: 10,color: ColorValues.LightGray),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045,
                      ),
                      CustomButton(
                          text: 'Sign In',
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => MyBottomNavigationBar()),
                                  (route) => false, // Pop all routes
                            );
                          }),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an Account?',
                            style: TextStyle(color: ColorValues.LightGray, fontSize: 11),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SignUp(), // Replace with your next screen widget.
                                  ),
                                );
                              },
                              child: Text(
                                ' Sign Up',
                                style: TextStyle(
                                    color: ColorValues.Green,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}