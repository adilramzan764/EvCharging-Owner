import 'package:get/get.dart';

class SelectedAnemtiesController extends GetxController {
  final RxList<String> amenities = <String>[
    'Dining',
    'Restroom',
    'Shopping',
    'Lodging',
    'Park',
    'Wifi',
    'Grocery',
    'Free Charge'
  ].obs;

  final RxList<String> selectedamenities = <String>[].obs;
  final RxList<bool> isCheckedList = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,

  ].obs;

  void toggleAmenity(int index) {
    isCheckedList[index] = !isCheckedList[index];
    if(isCheckedList[index])
      selectedamenities.add(amenities[index]);
    else
      selectedamenities.remove(amenities[index]);

    print('Selected Amenities: ${selectedamenities.toList()}');
  }

  void addamenities() {
    selectedamenities.addAll([
      'Dining',
      'Restroom',
      'Shopping',
      'Lodging',
      'Park',
      'Wifi',
      'Grocery',
      'Free Charge'
    ]);
    isCheckedList.assignAll(List.generate(amenities.length, (index) => false));
  }

  @override
  void onInit() {
    // initializeLists(); // Initialize the lists when the controller is initialized
    super.onInit();
  }
}
