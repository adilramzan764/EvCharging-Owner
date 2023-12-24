import 'dart:io';

import 'package:car_charging/Model/Seller_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../ApiServices/SignUpApi.dart';
import '../../Utils/Assets/Assets.dart';
import '../../Utils/Color/Color.dart';
import '../../Utils/Widgets/Custom Button/Custom Button.dart';
import '../../Utils/Widgets/Custom Text Field/CustomTextField.dart';
import '../../Utils/Widgets/ImagePicker_Dialog.dart';
import '../../Utils/Widgets/SnackBarManager.dart';
import '../../View Model/SignUp_CiewModel.dart';
import 'StationInfo.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  File? _selectedImage;
  final SignUp_ViewModel userViewModel = Get.put(SignUp_ViewModel());

  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController phonenumber=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();


  @override
  Widget build(BuildContext context) {
    final ImagePickerHandler _imagePickerHandler = ImagePickerHandler(
      context,
      (File? pickedImage) {
        setState(() {
          _selectedImage = pickedImage;
        });
      },
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.38,
                width: double.infinity,
                child: Image.asset(
                  ImageAssets.signup,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.68,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            color: ColorValues.Gray,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          'Personal Information Step 1:',
                          style: TextStyle(
                            color: ColorValues.Gray,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(
                            icon: Transform.scale(
                              scale: 0.4,
                              child: SvgPicture.asset(
                                ImageAssets.Person,
                              ),
                            ),
                            hinttext: 'First name', controller: firstname,
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
                                ImageAssets.Person,
                              ),
                            ),
                            hinttext: 'Last name', controller: lastname,
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
                                ImageAssets.Call,
                              ),
                            ),
                            hinttext: 'Phone number', controller: phonenumber,
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
                                ImageAssets.MailBox,
                              ),
                            ),
                            hinttext: 'Email', controller: email,
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
                              ),
                            ),
                            hinttext: 'Password', controller: password,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.020,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Optional",
                              style: TextStyle(
                                fontSize: 12,
                                color: ColorValues.Gray,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.010,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              _imagePickerHandler.showPickerDialog();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: ColorValues.Blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(ImageAssets.Camera),
                                SizedBox(width: 10),
                                Text(
                                  "Upload Photo",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: ColorValues.whiteColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        if (_selectedImage != null)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  // shape: _selectedImage != null ? BoxShape.rectangle : BoxShape.circle,
                                  borderRadius: BorderRadius.circular(
                                      12), // You can adjust the border radius
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  // You can adjust the border radius
                                  child: _selectedImage != null
                                      ? Image.file(
                                          _selectedImage!,
                                          height: 120,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        )
                                      : null, // Set the child to null if no image is selected
                                ),
                              ),
                            ),
                          ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Container(
                          height: 32,
                          width: 140,
                          child: CustomButton(
                            text: 'Sign Up',
                            onPressed: () async {
                              if (_selectedImage.isNull)
                                SnackbarManager.showSnackbar(title: 'Error!', message: 'Profile pic not found', context: context);
                              else {
                                await EasyLoading.show(
                                  status: 'Signing Up...',
                                  maskType: EasyLoadingMaskType.black,
                                );
                                // await Future.delayed(Duration(seconds: 3));
                                SellerModel newuser = SellerModel(
                                    firstName: firstname.text,
                                    lastName: lastname.text,
                                    email: email.text,
                                    password: password.text,
                                    phone: phonenumber.text,
                                    profileImage:
                                        _selectedImage!.path.toString());
                                print(_selectedImage!.path.toString());

                                print(newuser.toString());
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => StationInfo(),
                                //   ),
                                // );
                                userViewModel.createUser(newuser, context).then(
                                    (value) async => await EasyLoading
                                        .dismiss() // Ensure loading indicator is dismissed

                                    );

                                // OTPConfirmationDialog(context); // Call the dialog function

                                // await EasyLoading.dismiss();

                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an Account?',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 11,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                ' Sign In',
                                style: TextStyle(
                                  color: ColorValues.Green,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
