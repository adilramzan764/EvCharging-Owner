import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Model/NotificationModel.dart';
import '../../Utils/Widgets/CutomWidgets.dart';
import 'package:car_charging/Utils/Assets/Assets.dart';
import 'package:car_charging/Utils/Color/Color.dart';

class Notification_Screen extends StatefulWidget {
  Notification_Screen({Key? key}) : super(key: key);

  @override
  State<Notification_Screen> createState() => _Notification_ScreenState();
}

class _Notification_ScreenState extends State<Notification_Screen> {
  final List<NotificationModel> notifications = [
    NotificationModel(
      profilepic: 'assets/model1.jpg',
      name: '@Maya284',
      notification: ' Lorem ipsum dolor sit amet, consectetur',
      date: 'April 23,2022',
      time: '10:30', // Replace with your actual time
    ),
    NotificationModel(
      profilepic: 'assets/model2.jpg',
      name: '@aina26',
      notification: ' Lorem ipsum dolor sit amet, consectetur',
      date: 'April 23,2022',
      time: '10:30', // Replace with your actual time
    ),
    NotificationModel(
      profilepic: 'assets/model3.jpg',
      name: '@Jimmy26',
      notification: ' Lorem ipsum dolor sit amet, consectetur',
      date: 'April 23,2022',
      time: '10:30', // Replace with your actual time
    ),
    NotificationModel(
      profilepic: 'assets/model4.jpg',
      name: '@Maha284',
      notification: ' Lorem ipsum dolor sit amet, consectetur',
      date: 'April 23,2022',
      time: '10:30', // Replace with your actual time
    ),
    NotificationModel(
      profilepic: 'assets/model1.jpg',
      name: '@Maya284',
      notification: ' Lorem ipsum dolor sit amet, consectetur',
      date: 'April 23,2022',
      time: '12:30', // Replace with your actual time
    ),
    NotificationModel(
      profilepic: 'assets/model4.jpg',
      name: '@aina26',
      notification: ' Lorem ipsum dolor sit amet, consectetur',
      date: 'April 22,2022',
      time: '01:30', // Replace with your actual time
    ),
    // Add more notifications here
  ];

  @override
  void initState() {
    super.initState();
    // Sort notifications by date
    notifications.sort((a, b) => (a.time ?? '').compareTo(b.time ?? ''));
  }

  bool _isSameDay(String? date1, String? date2) {
    // Check if both dates are non-null and then compare
    return date1 != null && date2 != null && date1 == date2;
  }


  String _getFormattedDate(String? date) {
    // You may need to customize the date formatting based on your requirements
    return date ?? ''; // Use an empty string if date is null
  }

  String _getNotificationCount(String date) {
    int count = 0;
    for (var notification in notifications) {
      if (_isSameDay(notification.date ?? "", date)) {
        count++;
      }
    }
    return count.toString();
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
                    blurRadius: 1),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.left_chevron,
                        size: 16,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Notifications',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField_Search(context),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      final notification = notifications[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (index == 0 ||
                              !_isSameDay(notifications[index - 1].date,
                                  notification.date))
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0,top: 10,right: 10,bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    _getFormattedDate(notification.date ?? ""),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    height: MediaQuery.of(context).size.height *0.02,
                                    width: MediaQuery.of(context).size.width *0.08,
                                    decoration: BoxDecoration(
                                      color: ColorValues.Blue,
                                     borderRadius: BorderRadius.circular(15)
                                    ),


                                    child: Center(
                                      child: Text(
                                        '${_getNotificationCount(notification.date ?? "")} ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: Colors.grey.withOpacity(0.7),),
                                  )
                                ],
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7.0),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    ImageAssets.notification,
                                    height: 18,
                                    width: 18,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        notifications[index].notification,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        notifications[index].date.toString(),
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: ColorValues.Blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        notifications[index].time.toString(),
                                        style: TextStyle(
                                          fontSize: 9,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
