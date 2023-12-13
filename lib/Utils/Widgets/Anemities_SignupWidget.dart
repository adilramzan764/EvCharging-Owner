import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Assets/Assets.dart';
import '../Color/Color.dart';


class Anemities_SignupWidget extends StatefulWidget {
  final String text;
  final String icon;

  Anemities_SignupWidget({required this.text,required this.icon});
  @override
  _Anemities_SignupWidgetState createState() => _Anemities_SignupWidgetState();
}

class _Anemities_SignupWidgetState extends State<Anemities_SignupWidget> {
  bool isChecked = false;
final List<String> anemeties=[
  'Dining',
  'Restroom',
  'Shopping',
  'Lodging',
  'Park',
  'Wifi',
  'Grocery',
  'Free Charge'
];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(widget.icon,color: isChecked ? ColorValues.Blue : Colors.grey,),
            SizedBox(width: 10,),
            Text(widget.text, style: TextStyle(fontSize: 13, color: isChecked ? ColorValues.Blue : Colors.grey)),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: isChecked ? ColorValues.Blue : Colors.white,
                      border: Border.all(
                        color: isChecked ? ColorValues.Blue : Colors.grey, // Change the color accordingly
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: isChecked
                        ? Center(
                      child: Icon(
                        Icons.check,
                        size: 18,
                        color: Colors.white,
                      ),
                    )
                        : null,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Divider(color: Colors.grey.withOpacity(0.3), thickness: 1),
      ],
    );
  }
}