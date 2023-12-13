import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Color/Color.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  CustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width/ 1.5,
      height: 32,
      decoration: BoxDecoration(
          borderRadius: text=='Available' || text=='In use' ?BorderRadius.circular(8) : BorderRadius.circular(25),
          border: Border.all(
            color: text == 'Withdraw' || text=='Get Direction' ? ColorValues.Green : Colors.transparent,
          ),
          color:text=='Available' ?   ColorValues.Green:  text=='Withdraw' || text=='Get Direction' ? ColorValues.whiteColor : ColorValues.Green
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child:  text=='Get Direction' ?  Row(
          children: [
            SvgPicture.asset('assets/directions.svg',color: ColorValues.Green,height: 12,width: 12,),
            Text('  Get Direction',style: TextStyle(fontSize: 14,color: ColorValues.Green),)
          ],
        ) : Text(
          text,
          style: TextStyle(color: text=='Withdraw' ?ColorValues.Green : ColorValues.whiteColor ,fontSize: text=='Available' || text=='Withdraw' ? 8:14),
        ),
      ),
    );
  }

}