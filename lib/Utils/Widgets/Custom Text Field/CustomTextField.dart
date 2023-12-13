import 'package:car_charging/Utils/Color/Color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  Widget? icon; // Make the icon parameter optional
  String hinttext;

  CustomTextField({Key? key, this.icon, required this.hinttext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ColorValues.LightGray,
            blurRadius: 2,
            offset: Offset(1, 2)
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hinttext,
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.5),
            fontSize: 11,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}