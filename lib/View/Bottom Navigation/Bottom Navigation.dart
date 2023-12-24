import 'package:car_charging/Utils/Assets/Assets.dart';
import 'package:car_charging/View/Bookings/Bookings.dart';
import 'package:car_charging/View/BottomBarScreens/Settings/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Sockets/Sockets.dart';
import '../../Utils/Color/Color.dart';
import '../../const/BaseURL.dart';
import '../BottomBarScreens/Home.dart';
import '../BottomBarScreens/Payment_Management.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _StackedBottomNavigationBarState createState() =>
      _StackedBottomNavigationBarState();
}

class _StackedBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  //
  @override
  void initState() {
    super.initState();
    // Initialize socket connection
    Get.put(SocketController());

    // listeningforORders();

    //

    // booking();
  }
  //
  //
  // Future<IO.Socket> initSocket() async {
  //   final socket = IO.io(baseUrl, <String, dynamic>{
  //     'transports': ['websocket'],
  //   });
  //
  //   socket.on('connect', (_) {
  //     print('Socket connected');
  //   });
  //
  //   return socket;
  // }

  final List<Widget> _screens = [
    Home(),
    Payment_Management(),
    Bookings(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[_currentIndex],
          // if(_currentIndex==1)
          Positioned(
            left: 1.0.h,
            right: 1.0.h,
            bottom: 2.0.h,
            child: Container(
              height: 7.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.h),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 1,
                      spreadRadius: 1),
                ],
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  CustomBottomNavigationBar(
                    currentIndex: _currentIndex,
                    onTap: (int index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  // Padding(
                  //   padding: _currentIndex==0 ? EdgeInsets.only(left: 5.h) : _currentIndex==1 ? EdgeInsets.only(left: 13.h) : _currentIndex==2 ? EdgeInsets.only(left: 21.h) : _currentIndex==3 ? EdgeInsets.only(left: 29.h) : EdgeInsets.only(left: 37.h) ,
                  //   child: Icon(Icons.circle,color: ColorValues.primaryblue,size: 10,),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height*0.07, // Set your desired height here
      height: 7.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.h),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 1,
              spreadRadius: 1),
        ],
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3.2.h),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: ColorValues.Blue,
          selectedLabelStyle: const TextStyle(fontSize: 0),
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            _buildNavItem(
                currentIndex == 0 ? ImageAssets.home_g : ImageAssets.home,
                currentIndex,
                0),
            _buildNavItem(
                currentIndex == 1 ? ImageAssets.hand_g : ImageAssets.hand,
                currentIndex,
                1),
            _buildNavItem(
                currentIndex == 2
                    ? ImageAssets.calender_g
                    : ImageAssets.calender,
                currentIndex,
                2),
            _buildNavItem(
                currentIndex == 3
                    ? ImageAssets.setting_g
                    : ImageAssets.settings,
                currentIndex,
                3),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      String iconPath, int currentIndex, int index) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          if (currentIndex == index)
            Icon(
              Icons.circle,
              color: ColorValues.Green,
              size: 10,
            ),
          SvgPicture.asset(
            iconPath,
            color: currentIndex == index ? ColorValues.Green : null,
            width: 2.5.h,
            height: 2.5.h,
          ),
        ],
      ),
      label: '',
    );
  }
}
