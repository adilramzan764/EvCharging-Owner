import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectPaymentMethod_Widget extends StatefulWidget {
  int index; String imagePath; String cardNumber;int selectedCardIndex;
   SelectPaymentMethod_Widget({Key? key,required this.index,required this.imagePath,required this.cardNumber,required this.selectedCardIndex,}) : super(key: key);


  @override
  State<SelectPaymentMethod_Widget> createState() => _SelectPaymentMethod_WidgetState();
}

class _SelectPaymentMethod_WidgetState extends State<SelectPaymentMethod_Widget> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SizedBox(width: 5),
        Image.asset(widget.imagePath),
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            widget.cardNumber,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                setState(() {
                  widget.selectedCardIndex = widget.index;
                });
              },
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: widget.selectedCardIndex == widget.index
                        ? Colors.blue // Selected color
                        : Colors.grey.withOpacity(0.5), // Unselected color
                  ),
                ),
                child: widget.selectedCardIndex == widget.index
                    ? Center(
                  child: Icon(
                    Icons.circle,
                    size: 12.0,
                    color: Colors.blue, // Selected color
                  ),
                )
                    : SizedBox(),
              ),
            ),
          ),
        ),
      ],
    );
  }


}
