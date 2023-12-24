import 'package:car_charging/View%20Model/SelectedAnemtiesController.dart';
import 'package:car_charging/View/Sign%20In/SignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Model/StationModel.dart';
import '../../Utils/Assets/Assets.dart';
import '../../Utils/Color/Color.dart';
import '../../Utils/Widgets/Anemities_SignupWidget.dart';
import '../../Utils/Widgets/ChargingSlots_SignupWidget.dart';
import '../../Utils/Widgets/Custom Button/Custom Button.dart';
import '../../Utils/Widgets/Custom Text Field/CustomTextField.dart';
import '../../View Model/StationInfoSignup_ViwModel.dart';

class StationInfo extends StatefulWidget {
  String signup_userid;
  StationInfo({Key? key, required this.signup_userid}) : super(key: key);

  @override
  State<StationInfo> createState() => _StationInfoState();
}

class _StationInfoState extends State<StationInfo> {
  final List<String> anemeties = [
    'Dining',
    'Restroom',
    'Shopping',
    'Lodging',
    'Park',
    'Wifi',
    'Grocery',
    'Free Charge'
  ];

  final List<String> chargingslots = [
    'Ac -type 2',
    'CSI!-Dc',
    'GB/T',
    'Wall',
    'Type 2',
    'Type 3',

  ];
  int selected_chargingslot=-1;

  void onChargingSlotSelected(int selectedIndex) {
    if (selectedIndex >= 0 && selectedIndex < chargingslots.length) {
      setState(() {
        selected_chargingslot = selectedIndex;
      });
    }
  }

  final StationInfoSignupViewModel viewModel = Get.put(StationInfoSignupViewModel());

  final List<String> icons = [
    ImageAssets.dining,
    ImageAssets.restroom,
    ImageAssets.Bag,
    ImageAssets.lodging,
    ImageAssets.PARK,
    ImageAssets.wifi,
    ImageAssets.grocery,
    ImageAssets.charge,
  ];

  TextEditingController servicehours = TextEditingController();

  TextEditingController numberofchargingslots =
      TextEditingController(text: '3');

  TextEditingController perhourprice = TextEditingController();

  TextEditingController parkingprice = TextEditingController();

  List<TextEditingController> chargingSlotControllers = [];

  List<bool> isListVisibleList = [];

  List<bool> ischargertypeslected = [];

  List<String> selectedslotsforapi=[];


  List<int> selectedChargingSlotsList=[];
  // List<bool> ischargertypeslected =List.generate(numofchargingslots, (index) => false);






  void updateChargingSlots() {
    int numofchargingslots = int.tryParse(numberofchargingslots.text) ?? 0;

    chargingSlotControllers = List.generate(
      numofchargingslots,
          (index) => TextEditingController(),
    );

    isListVisibleList = List.generate(numofchargingslots, (index) => false);

    ischargertypeslected = List.generate(numofchargingslots, (index) => false);


    selectedChargingSlotsList = List.generate(numofchargingslots, (index) => -1);




  }

  SelectedAnemtiesController _controller = SelectedAnemtiesController();

  @override
  void initState() {
    super.initState();
    updateChargingSlots();
  }

  @override
  Widget build(BuildContext context) {
    int numofchargingslots = int.tryParse(numberofchargingslots.text) ?? 0;

    chargingSlotControllers = List.generate(
      numofchargingslots,
      (index) => TextEditingController(),
    );

    print(widget.signup_userid.toString());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.38,
                width: double.infinity,
                child: Image.asset(
                  ImageAssets.signup,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.68,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              color: ColorValues.Gray,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          'Personal Information Step 2:',
                          style: TextStyle(
                              color: ColorValues.Gray,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(
                            icon: Transform.scale(
                                scale: 0.4,
                                child: SvgPicture.asset(
                                  ImageAssets.servicehours,
                                )),
                            hinttext: 'Service Hours',
                            controller: servicehours,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(
                            icon: Transform.scale(
                                scale: 0.4,
                                child: SvgPicture.asset(
                                  ImageAssets.plug,
                                )),
                            hinttext: 'Number of charging Spots',
                            controller: numberofchargingslots,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Column(
                          children: List.generate(
                            numofchargingslots,
                                (i) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              child: Container(
                                height: !isListVisibleList[i] ? 40 : MediaQuery.of(context).size.height * 0.39,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorValues.LightGray,
                                      blurRadius: 2,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Transform.scale(
                                            scale: 1.0,
                                            child: SvgPicture.asset(
                                              ImageAssets.plug,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            ischargertypeslected[i]
                                                ? 'Charging Slot ${i + 1}'
                                                : selectedChargingSlotsList[i] >= 0
                                                ? chargingslots[selectedChargingSlotsList[i]]
                                                : 'Charging Slot ${i + 1}',
                                            style:
                                            ischargertypeslected[i]
                                                ?  TextStyle(
                                              color: Colors.grey.withOpacity(0.5),
                                              fontSize: 11,
                                            )
                                                : selectedChargingSlotsList[i] >= 0
                                                ?  TextStyle(
                                              // color: Colors.grey.withOpacity(0.5),
                                              fontSize: 13,
                                            )
                                                :  TextStyle(
                                              color: Colors.grey.withOpacity(0.5),
                                              fontSize: 11,
                                            ),



                                            // ischargertypeslected[i] ?  TextStyle(
                                            //   color: Colors.grey.withOpacity(0.5),
                                            //   fontSize: 11,
                                            // ) : TextStyle(
                                            //   // color: Colors.grey.withOpacity(0.5),
                                            //   fontSize: 13,
                                            // ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isListVisibleList[i] = !isListVisibleList[i];
                                                  });
                                                },
                                                child: Icon(
                                                  isListVisibleList[i]
                                                      ? CupertinoIcons.chevron_up
                                                      : CupertinoIcons.chevron_down,
                                                  size: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Visibility(
                                        visible: isListVisibleList[i],
                                        child: Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: ListView.builder(
                                              padding: EdgeInsets.zero,
                                              physics: NeverScrollableScrollPhysics(),
                                              itemCount: chargingslots.length,
                                              itemBuilder: (context, index) {
                                                return ChargingSlots_SignupWidget(
                                                  text: chargingslots[index],
                                                  index: index,
                                                  selectedindex: selectedChargingSlotsList[i],
                                                  onSelected: (int selectedIndex) {
                                                    setState(() {
                                                      selectedChargingSlotsList[i] = selectedIndex;
                                                    });
                                                    onChargingSlotSelected(selectedIndex);
                                                    // if(ischargertypeslected[i])
                                                    // selectedslotsforapi.add(chargingslots[selected_chargingslot]);
                                                    // else
                                                    //   selectedslotsforapi.remove(chargingslots[selected_chargingslot]);
                                                    // print("selectedslotsforapi"+ selectedslotsforapi.toString());

                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),



                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(
                            icon: Transform.scale(
                                scale: 0.4,
                                child: SvgPicture.asset(
                                  ImageAssets.price,
                                )),
                            hinttext: 'Per Hour Price',
                            controller: perhourprice,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Optional",
                                style: TextStyle(
                                    fontSize: 12, color: ColorValues.Gray),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(
                            icon: Transform.scale(
                                scale: 0.4,
                                child: SvgPicture.asset(
                                  ImageAssets.car,
                                )),
                            hinttext: 'Parking Price',
                            controller: parkingprice,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Amenities",
                                style: TextStyle(
                                    fontSize: 12, color: ColorValues.Gray),
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.010,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                              height: 330,
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: ColorValues.LightGray,
                                        blurRadius: 2,
                                        offset: Offset(1, 2))
                                  ]),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _controller.amenities.length,
                                itemBuilder: (context, index) {
                                  return Anemities_SignupWidget(
                                    text: _controller.amenities[index],
                                    icon: icons[index],
                                    isChecked: _controller.isCheckedList[index],
                                    onTap: () {
                                      _controller.toggleAmenity(index);
                                    },
                                  );
                                },
                              )
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                        ),
                        Container(
                          height: 32,
                          width: 140,
                          child: CustomButton(
                              text: 'Sign Up',
                              onPressed: () async {
                                await EasyLoading.show(
                                  status: 'Almost there...',
                                  maskType: EasyLoadingMaskType.black,
                                );
                                StationModel station= StationModel(userId: widget.signup_userid!, serviceHours: '4', numberOfChargingSpots: '3', perHourPrice: '300', parkingPrice: '60', amenities: _controller.selectedamenities, namesOfChargingSpots: ['AC Type 2','GB/T','Wall']);
                                viewModel.station.value = station; // Use the .value property to set the Rx variable
                                viewModel.addStation(context).then((value) async =>
                                await EasyLoading.dismiss()
                                );
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         SignIn(), // Replace with your next screen widget.
                                //   ),
                                // );
                              }),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an Account?',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 11),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  ' Sign In',
                                  style: TextStyle(
                                      color: ColorValues.Green,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
