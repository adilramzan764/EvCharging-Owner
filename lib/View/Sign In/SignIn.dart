import 'package:car_charging/Utils/Assets/Assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/Color/Color.dart';
import '../../Utils/Widgets/Custom Button/Custom Button.dart';
import '../../Utils/Widgets/Custom Text Field/CustomTextField.dart';
import '../../View Model/LogIn_ViewModel.dart';
import '../../View Model/UserViewModel.dart';
import '../Bottom Navigation/Bottom Navigation.dart';
import '../ForgetPassword/ForgetPasswrod.dart';
import '../Sign Up/SignUp.dart';


class SignIn extends StatelessWidget {
   SignIn({Key? key}) : super(key: key);

   TextEditingController email=TextEditingController(text: 'john@gmail.com');
   TextEditingController password=TextEditingController(text: '123');
   final LoginViewModel loginViewModel = Get.put(LoginViewModel());

   final UserViewModel userViewModel = Get.put(UserViewModel());


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
                          hinttext: 'johnsondoe@nomail.com.', controller: email,
                        ),
                      ),
                Obx(
                      () => loginViewModel.loginResponse.value.error !=
                      'Invalid password' &&
                      loginViewModel.loginResponse.value.message !=
                          'Login successful' && loginViewModel.loginResponse.value.error !='' && loginViewModel.loginResponse.value.message != ''
                      ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${loginViewModel.loginResponse.value.message ?? loginViewModel.loginResponse.value.error ?? ""}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),),
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomTextField(
                          icon: Transform.scale(
                              scale: 0.4,
                              child: SvgPicture.asset(
                                ImageAssets.Lock,
                              )),
                          hinttext: '********', controller: password,
                        ),
                      ),
                Obx(
                      () => loginViewModel.loginResponse.value.message !=
                      'Login successful' && loginViewModel.loginResponse.value.error !='' && loginViewModel.loginResponse.value.message != ''
                      ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${loginViewModel.loginResponse.value.message ?? loginViewModel.loginResponse.value.error ?? ""}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  )
                      : SizedBox(height: 4,),),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
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
                        onPressed: () async {
                          loginViewModel.login(email.text, password.text);

                          // Wait for the login process to complete
                          await Future.delayed(Duration(milliseconds: 500)); // Adjust the duration if needed

                          if (loginViewModel.loginResponse.value.message == 'Login successful' &&
                              loginViewModel.loginResponse.value.id != '') {
                            EasyLoading.show(
                              status: 'Signing In...',
                              maskType: EasyLoadingMaskType.black,
                            );
                            await userViewModel.getUserData(); // Call getUserData after successful login
                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.setString("stationid", userViewModel.userExists.value.station);
                            print('User ID: ${userViewModel.userExists.value.id}');
                            print('spots: ${userViewModel.userExists.value.spots}');

                            await Future.delayed(const Duration(seconds: 2));
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyBottomNavigationBar(),
                              ),
                                  (route) => false,
                            );
                            EasyLoading.dismiss();
                          }
                        },
                      ),

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