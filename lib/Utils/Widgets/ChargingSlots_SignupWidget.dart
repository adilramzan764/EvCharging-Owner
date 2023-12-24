


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChargingSlots_SignupWidget extends StatefulWidget {
  final String text;
  final int index;
   int selectedindex;
  final Function(int) onSelected;
  final String? icon;

  ChargingSlots_SignupWidget({
    required this.text,
    required this.index,
    required this.selectedindex,
    required this.onSelected,
    this.icon,
  });

  @override
  ChargingSlots_SignupWidgetState createState() =>
      ChargingSlots_SignupWidgetState();
}

class ChargingSlots_SignupWidgetState
    extends State<ChargingSlots_SignupWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 10,),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 13,
                color: widget.selectedindex == widget.index
                    ? Colors.blue
                    : Colors.grey,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.selectedindex =
                      widget.selectedindex == widget.index ? -1 : widget.index;
                      widget.onSelected(widget.selectedindex);
                    });
                  },
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: widget.selectedindex == widget.index
                          ? Colors.blue
                          : Colors.white,
                      border: Border.all(
                        color: widget.selectedindex == widget.index
                            ? Colors.blue
                            : Colors.grey,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: widget.selectedindex == widget.index
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
        Divider(
          color: Colors.grey.withOpacity(0.3),
          thickness: 1,
        ),
      ],
    );
  }
}