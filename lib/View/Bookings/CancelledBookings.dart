import 'package:flutter/cupertino.dart';

import '../../Model/OrderModel.dart';
import '../../Utils/Widgets/Bookings_Widget.dart';


class CancelledBookings extends StatelessWidget {
  List<OrderModel> orders;

  CancelledBookings({Key? key,required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              itemCount: orders.length, // Number of items in your list
              itemBuilder: (BuildContext context, int index) {
                final order = orders[index];

                // Return a widget for each item at the specified index
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Bookings_Widget(isupcoming: false, iscompleted: false, iscancelled: true,order: order,),
                );
              },
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.1,)

      ],
    );
  }
}
