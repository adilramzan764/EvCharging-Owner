import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../View Model/SelectedAnemtiesController.dart';
import '../Assets/Assets.dart';
import '../Color/Color.dart';


class Anemities_SignupWidget extends StatefulWidget {
  final String text;
  final String icon;
  final bool isChecked;
  final VoidCallback onTap;

  Anemities_SignupWidget({
    required this.text,
    required this.icon,
    required this.isChecked,
    required this.onTap,
  });  @override
  _Anemities_SignupWidgetState createState() => _Anemities_SignupWidgetState();
}

class _Anemities_SignupWidgetState extends State<Anemities_SignupWidget> {

bool isChecked=false;
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
                    widget.onTap(); // Call the onTap function
                    widget.isChecked;
                    setState(() {
                      isChecked = !isChecked;
                    });
                    // SelectedAnemtiesController().toggleAmenity(index)
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