
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Utils/Color/Color.dart';
import '../../View Model/GetOrders_VM.dart';
import 'CancelledBookings.dart';
import 'ComplettedBookings.dart';
import 'UpcomingBookings.dart';

class Bookings extends StatefulWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final OrderViewModel _orderViewModel = Get.put(OrderViewModel()); // Instantiate OrderViewModel


  @override
  void initState() {
    super.initState();
    _orderViewModel.fetchOrdersById();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection); // Add listener for tab changes
  }

  // Method to handle tab selection and change text color
  void _handleTabSelection() {
    setState(() {}); // Trigger a rebuild when the tab is changed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 85,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Booking Slots',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  backgroundColor: Colors.white,
                  unselectedBackgroundColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  tabs: [
                    Tab(
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width *0.28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Active',
                            style: TextStyle(
                              color: _tabController.index == 0 ? ColorValues.Blue : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width *0.28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Completed',
                            style: TextStyle(
                              color: _tabController.index == 1 ? ColorValues.Blue : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width *0.28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Cancelled',
                            style: TextStyle(
                              color: _tabController.index == 2 ? ColorValues.Blue : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  controller: _tabController,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      ActiveBookings(),
                      ComplettedBookings(orders: _orderViewModel.orders,),
                      CancelledBookings(orders: _orderViewModel.orders,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
